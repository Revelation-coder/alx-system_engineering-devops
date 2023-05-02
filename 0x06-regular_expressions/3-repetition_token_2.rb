#!/usr/bin/env ruby

if ARGV.length != 1
  puts "Usage: #{$0} <string>"
  exit 1
end

string = ARGV[0]

matches = string.scan(/h{1}b{1}(t{1,})n/)
matches.each do |match|
  puts match[0]
end

