#!/usr/bin/env ruby
load 'common.rb'
$stdin.flush
$stdout.flush
$stdout.sync = true

@gotit = []
@ignore = []
@unknown = []
@kaboodle = []
@lost = File.readlines("sources/lost.txt")
@found = File.readlines("sources/found.txt")

@lost.each do |line|
  isolate("#{line}")
  grep = %x[grep "#{@dumpty[@finds]}" "sources/current.txt"]
  if grep.length > 1
    @gotit.append(grep)
    @ignore.append(line)
  else
    @unknown.append(line)
  end
end

missing = File.open("sources/missing.txt", "w")
amalgamate(@unknown, missing)
missing.close

ignore = File.open("results/ignore.txt", "w")
amalgamate(@ignore, ignore)
ignore.close

meld(@found)
meld(@gotit)
@kaboodle.uniq!

sot = File.open("sources/sot.txt", "w")
amalgamate(@kaboodle, sot)
sot.close