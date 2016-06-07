#!/bin/sh

# use of pump

set -e
# set -x

# This is also in pump
readonly WORKING_DIR='/Users/maximeviargues/tmp'
readonly SOCKET_DIR="$WORKING_DIR/socket_dir"

readonly SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
readonly PUMP_SERVER_CONFIG='current_server.config'
readonly SHUTDOWN_SERVER=1

echo "Running custom DistClang with pump"
# echo "pwd:"
# pwd

echo "current path $SCRIPT_DIR"

include_server_stderr=$SOCKET_DIR/stderr
include_server_stdout=$SOCKET_DIR/stdout


source "$SCRIPT_DIR/pump_config"

readonly CONFIG_PATH="$SCRIPT_DIR/$PUMP_SERVER_CONFIG"
if [[ -f "$CONFIG_PATH" ]]; then
	echo "Reading config from $CONFIG_PATH"
	pump_output=$(cat "$CONFIG_PATH")
	if [[ -z $pump_output ]]; then
		echo "Couldn't read config file, or is empty"
		exit 1
	fi
fi
# TODO manage if the config file doesn't exist, make sure the server starts. Could be working already.

echo "Applying server config:"
echo $pump_output
eval "$pump_output"

# check if the server is running
# echo "Server PID = $INCLUDE_SERVER_PID"
if [[ -z $INCLUDE_SERVER_PID ]] || ! ps -p $INCLUDE_SERVER_PID; then
	echo "Server not running"
	rm -f $SOCKET_DIR/stderr
	rm -f $SOCKET_DIR/stdout

	echo "Starting server..."
	pump_output=$("$SCRIPT_DIR/pump" --startup)
	eval "$pump_output"
	if [[ $? -ne 0 ]]; then
		echo "Failed to startup the server"
		exit 1
	fi
fi
echo "Server PID = $INCLUDE_SERVER_PID"

if [[ -z $INCLUDE_SERVER_PORT ]]; then
	echo "Error: The server port is empty!"
	exit 1
fi
# else
# We can't save if it's using temporary folders
echo "Saving config to $CONFIG_PATH"
echo $pump_output > "$CONFIG_PATH"

# echo "args: $@"


echo "Going to compile, press Enter to continue..."
read input_key


echo "Calling distcc..."
"$SCRIPT_DIR/distcc" xcrun clang ${@}

if [[ $SHUTDOWN_SERVER -eq 1 ]]; then
	echo "Stopping the server..."
	"$SCRIPT_DIR/pump" --shutdown
fi


if [ -f "$include_server_stdout" ]; then
	cat "$include_server_stdout"
fi
if [ -f "$include_server_stderr" ]; then
	cat "$include_server_stderr" >&2
fi