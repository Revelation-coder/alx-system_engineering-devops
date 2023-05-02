#!/usr/bin/env ruby

log_file = ARGV[0]

File.readlines(log_file).each do |line|
  if line =~ /(\[from:([\w\s]+)\])\s+(\[to:([\+\d]+)\])\s+(\[flags:([\d:-]+)\])/
    sender = $2
    receiver = $4
    flags = $6
    puts "#{sender},#{receiver},#{flags}"
  end
end

