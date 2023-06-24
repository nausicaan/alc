#!/usr/bin/env ruby
$stdin.flush
$stdout.flush
$stdout.sync = true
argument = ARGV

# Download the latest version of the Excel files holding the catalogue of urls
if argument[0] == "-d"
  x = File.readlines("sources/sheets.txt")
  x.each do |line|
    folder = line[109..129]
    $stdout.print %x[ansible-playbook playbook.yaml --tags=update --extra-vars "excel='#{line}' dir='#{folder}'"]
  end
end

# Run the discover section of the playbook.yaml
$stdout.print %x[ansible-playbook playbook.yaml --tags=discover]

e = File.readlines("sources/lost.txt")

# Put together a url minus the https://
def jenja()
  iterate = 0
  value = ""
  while iterate < @finds
    value = value + @dumpty[iterate] + "/"
    iterate += 1
  end
  return value
end

# Remove extraneous material from the url to arrive at the file name
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