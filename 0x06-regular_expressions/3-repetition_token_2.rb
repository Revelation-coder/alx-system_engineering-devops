#!/usr/bin/env ruby

string = ARGV[0]
puts string.scan.(/hb{1}t+n{1}/).join

