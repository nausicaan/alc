#!/usr/bin/env ruby
$stdin.flush
$stdout.flush
$stdout.sync = true

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

mirage = File.exist?("results/succeed.txt")

if mirage
  z = File.readlines("results/succeed.txt")
  z.each do |line|
    isolate("#{line}")
    line.chomp!
    line[0..43] = ""
    @humpty[0..43] = ""
    $stdout.print %x[mc cp --recursive ~/Documents/alc/files/assets/alc/assets/#{line} alc/assets/#{@humpty}]
  end
end

$stdout.print %x[ansible-playbook playbook.yaml --tags=clean]