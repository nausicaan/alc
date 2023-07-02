#!/usr/bin/env ruby
$stdin.flush
$stdout.flush
$stdout.sync = true
argument = ARGV

e = File.readlines("#{argument[0]}.txt")
e.uniq!
f = File.open("#{argument[0]}_smoothed.txt", "w")

e.each do |line|
  f.puts(line)
end

f.close