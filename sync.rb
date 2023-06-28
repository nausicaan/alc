#!/usr/bin/env ruby
$stdin.flush
$stdout.flush
$stdout.sync = true
arguments = ARGV

pod = arguments[0] # nginx-7c6c77578d-xwzcv

mirage = File.exist?("results/succeeded.txt")

if mirage
  i = 1
  z = File.readlines("results/succeeded.txt")
  z.each do |line|
    line.chomp!
    line[0..43] = ""
    $stdout.print %x[oc cp ~/Documents/alc/files/assets/alc/assets/#{line} cca383-dev/#{pod}:/storage/assets/#{line}]
    $stdout.puts i
    i += 1
  end
end