#!/usr/bin/env ruby

if ARGV.length != 1
  puts "Usage: #{$0} <string>"
  exit 1
end

string = ARGV[0]

if string.match(/hb*t*n/)
  puts string.scan(/h{1}tn{1}/).join
else
  exit 1
end

