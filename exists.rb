#!/usr/bin/env ruby
$stdin.flush
$stdout.flush
$stdout.sync = true
arguments = ARGV

# Variables
@vault = arguments[0]
@url = arguments[1]
sot = arguments[2]
@lost = ""
@found = ""

e = File.readlines("#{sot}")  # File contaiing the complete list of assets. sot = source of truth

# Create new files or overwite existing ones
def scribble(name, urls)
  open("sources/#{name}", 'w') do |f|
    f.print urls
  end
end

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