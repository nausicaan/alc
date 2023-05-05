#!/usr/bin/env ruby
$stdin.flush
$stdout.flush
$stdout.sync = true
arguments = ARGV

l = arguments[0]
e = File.readlines(l)

e.each do |line|
    line.chomp!
    $stdout.print %x[oc exec "#{arguments[1]}"-- rm -r "#{line}"]
end