#!/usr/bin/env ruby

string = ARGV[0]
puts string.scan(/\[from:(.*?)\] \[to:(.*?)\] \[flags:(.*?)\]/).join(",") 
