#!/usr/bin/env ruby
# regex built for Oniguruma library

# pattern to extract sender, receiver, and flags
pattern='s/.*from:(\S+).+\[to:(\S+)\].+\[flags:(\S+)\].*/\1,\2,\3/'

# read the log file line by line and extract the necessary information
while read -r line; do
  # apply the pattern and print the result
  if [[ $line =~ $pattern ]]; then
    echo "${BASH_REMATCH[1]},${BASH_REMATCH[2]},${BASH_REMATCH[3]}"
  fi
done < "$1"

