#!/bin/bash


sleep 1
i3-msg 'workspace 4; exec i3-sensible-terminal'
sleep 1
i3-msg 'workspace 11; exec google-chrome --new-window https://www.notion.so/madebymaze/dedc12011a804d15a48ebca8ac893bf3?v=fb361695a18c45fd9e2ad39139941e50'
sleep 1
i3-msg 'workspace 12; exec google-chrome --new-window https://mail.google.com/mail/u/0/ https://mail.google.com/mail/u/1/'
sleep 1
i3-msg 'workspace 12; exec discord'
sleep 10
i3-msg 'workspace 13; exec google-chrome --new-window https://www.youtube.com'
sleep 1
i3-msg 'workspace 20; exec spotify'
