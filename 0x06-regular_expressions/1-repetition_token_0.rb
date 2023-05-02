#!/usr/bin/env ruby

if ARGV.length != 1
  puts "Usage: #{$0} <string>"
  exit 1
end

string = ARGV[0]

if string.match(/hbt{1,4}n/)
  puts string.chomp
else
  exit 1
end

