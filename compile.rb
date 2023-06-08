#!/usr/bin/env ruby
$stdin.flush
$stdout.flush
$stdout.sync = true

f = File.open("sources/tsot.txt", "w")
g = File.open("sources/sot.txt", "w")

s1 = File.readlines("sources/csot.txt")
s2 = File.readlines("sources/nsot.txt")

s1.uniq!
s2.uniq!

s1.each do |line|
  f.print(line)
end

s2.each do |line|
  f.print(line)
end

f.close

s3 = File.readlines("sources/tsot.txt")
s3.uniq!

s3.each do |line|
  g.print(line)
end

g.close