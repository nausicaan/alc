#!/usr/bin/env ruby
$stdin.flush
$stdout.flush
$stdout.sync = true

$stdout.print %x[ansible-playbook playbook.yaml --tags=discover]

l = "sources/missing.txt"
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

mirage = File.exist?("results/succeed.txt")

if mirage
  y = "results/succeed.txt"
  z = File.readlines(y)
  z.each do |line|
    line[0..44] = ""
    $stdout.print %x[mc cp --recursive ~/Documents/alc/files/assets/alc/assets/#{line} alc/assets/#{line}]
  end
end