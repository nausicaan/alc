#!/usr/bin/env ruby
$stdin.flush
$stdout.flush
$stdout.sync = true

$stdout.print %x[ansible-playbook playbook.yaml --tags=discover]

l = "prompts/missing.txt"
e = File.readlines(l)

def jenja(finds, dumpty)
  iterate = 0
  value = ""
  while iterate < finds
    value = value + dumpty[iterate] + "/"
    iterate += 1
  end
  return value
end

e.each do |line|
  finds = line.count('/')
  tolerate = finds + 1
  dumpty = line.split('/', tolerate)
  humpty = jenja(finds, dumpty)
  humpty.chomp!
  dumpty[finds].chomp!
  $stdout.print %x[ansible-playbook playbook.yaml --tags=download --extra-vars "nextlink='#{humpty}' file='#{dumpty[finds]}'"]
end