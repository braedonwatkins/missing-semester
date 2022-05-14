#!/bin/bash

echo "Starting program at $(date)" #date substituted

echo "Running program $0 with $# arguments with pid$$"

for file in "$@"; do
	grep foobar "$file" > /dev/null 2> /dev/null
	# When pattern is not found, grep has exit status
	# We redirect STDOUT and STDEER to null register

	if [[ "$?" -ne 0 ]]; then
		echo "File #file does not have any foobar, adding one"
		echo "# foobar" >> "$file"
	fi
done
