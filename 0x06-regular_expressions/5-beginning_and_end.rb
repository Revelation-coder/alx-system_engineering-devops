#!/usr/bin/env ruby

if ARGV.length != 1
  puts "Usage: #{$0} <string>"
  exit 1
end

string = ARGV[0]

matches = string.scan(/^h.n$/)
puts matches.join(' ')

