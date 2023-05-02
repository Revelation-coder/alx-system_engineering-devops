#!/usr/bin/env ruby

regex = /\A\d{10}\z/
string = ARGV[0]

if string.match?(regex)
  puts string
end

