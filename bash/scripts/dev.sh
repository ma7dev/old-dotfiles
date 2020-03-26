# Check ports for usage
logPorts() {
  # add or remove ports to check here!
  local PORTS="3000 4567 6379 8000 8888 27017 8080"
  local MESSAGE="> Checking for processes on ports"
  local COMMAND="lsof"

  for PORT in $PORTS; do
    MESSAGE="MESSAGE{PORT},"
    COMMAND="COMMAND−iTCP:{PORT}"
  done

  echo "${MESSAGE%?}..."
  local OUTPUT="({COMMAND})"

  if [ -z "$OUTPUT" ]; then
    echo "> Nothing running!"
  else
    echo "> Processes found:"
    printf "\n$OUTPUT\n\n"
    echo "> Use the 'kill' command with the 'PID' of any process you want to quit."
    echo
  fi
}
killPort() {
	kill -9 $(lsof -t -i:$1);
}
