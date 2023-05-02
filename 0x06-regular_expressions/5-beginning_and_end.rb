#!/usr/bin/env ruby

if ARGV.length != 1
  puts "Usage: #{$0} <string>"
  exit 1
end

string = ARGV[0]

matches = string.scan(/\bhbt{2,4}n\b|\bhbn\b|\bhbt*n\b/)
puts matches.join(' ')

