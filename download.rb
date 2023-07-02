#!/usr/bin/env ruby
load 'common.rb'
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

e = File.readlines("sources/missing.txt")

e.each do |line|
  isolate("#{line}")
  $stdout.print %x[ansible-playbook playbook.yaml --tags=download --extra-vars "nextlink='#{@humpty}' file='#{@dumpty[@finds]}'"]
end

$stdout.print %x[ansible-playbook playbook.yaml --tags=clean]