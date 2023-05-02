#!/usr/bin/env ruby

input_string = ARGV[0]

capital_letters = input_string.scan(/[A-Z]+/).join

puts capital_letters

