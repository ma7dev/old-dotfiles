#! /usr/bin/python3
import argparse
import sys
from subprocess import call
from threading import Thread

from constants import *
from util import timedelta_str, Stage, PomodoroState

MAX_LINE_LEN = 50
_kill = False

pomo_state = None

# TODO: use dunst
def notify_user(title, message):
    if ENABLE_DESKTOP_NOTIFS:
        try:
            call(['notify-send', title, message, '-t', '1000'])
        except FileNotFoundError:
            print("Skipping desktop notification because `notify-send` wasn't recognized.")


def update_progress_line(td):
    print(timedelta_str(td).ljust(MAX_LINE_LEN), end='\r')


def run_stage(stage, progress_callback=None):
    global pomo_state
    t = Thread(target=pomo_state.run, args=(stage, 0.2, progress_callback))
    t.start()
    try:
        t.join()
    except KeyboardInterrupt as interrupt:
        pomo_state.kill()
        t.join()
        raise interrupt

if sys.argv[1] == "1":
    ACTIVE_STAGE_MINUTES = 100
    REST_STAGE_MINUTES = 20
else:
    ACTIVE_STAGE_MINUTES = 50
    REST_STAGE_MINUTES = 10

print("working", ACTIVE_STAGE_MINUTES, "rest", REST_STAGE_MINUTES)

pomo_state = PomodoroState(ACTIVE_STAGE_MINUTES, REST_STAGE_MINUTES, STATE_FILE)
while True:
    run_stage(Stage.ACTIVE)
    pomo_state.prep_for_rest()
    notify_user("Pomodoro completed", "Time for the rest stage")
    run_stage(Stage.REST)
    pomo_state.prep_for_active()
    notify_user("Rest stage completed", "Time to get back to work")
