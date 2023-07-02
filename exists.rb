#!/usr/bin/env ruby
load 'common.rb'
$stdin.flush
$stdout.flush
$stdout.sync = true
arguments = ARGV

# Variables
@lost = ""
@found = ""
@url = arguments[1]
@vault = arguments[0]
e = File.readlines("sources/beta.txt")  # File temporary contaiing the complete list of assets.

# Test if we already have the file downloaded, and record it appropriately
def existence(slug)
  if File.file?("#{@vault}/#{slug}")
    @found << "#{@url}/#{slug}\n"
  else @lost << "#{@url}/#{slug}\n"
  end
end

# Examine the sot file and classify each url as lost or found
e.each do |line|
  if "#{line}".include? "http://"
    line[0..24] = ""
    existence(line.chomp)
  else
    line[0..25] = ""
    existence(line.chomp)
  end
end

@lost.chomp!
@found.chomp!

scribble("lost.txt", @lost)
scribble("found.txt", @found)