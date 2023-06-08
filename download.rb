#!/usr/bin/env ruby
$stdin.flush
$stdout.flush
$stdout.sync = true
argument = ARGV

if argument[0] == "-d"
  x = File.readlines("sources/sheets.txt")
  x.each do |line|
    folder = line[109..129]
    $stdout.print %x[ansible-playbook playbook.yaml --tags=update --extra-vars "excel='#{line}' dir='#{folder}'"]
  end
end

$stdout.print %x[ansible-playbook playbook.yaml --tags=discover]

e = File.readlines("sources/missing.txt")

def jenja()
  iterate = 0
  value = ""
  while iterate < @finds
    value = value + @dumpty[iterate] + "/"
    iterate += 1
  end
  return value
end

def isolate(line)
  @finds = line.count('/')
  tolerate = @finds + 1
  @dumpty = line.split('/', tolerate)
  @humpty = jenja()
  @humpty.chomp!
  @dumpty[@finds].chomp!
end

e.each do |line|
  isolate("#{line}")
  $stdout.print %x[ansible-playbook playbook.yaml --tags=download --extra-vars "nextlink='#{@humpty}' file='#{@dumpty[@finds]}'"]
end