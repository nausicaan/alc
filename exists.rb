#!/usr/bin/env ruby
$stdin.flush
$stdout.flush
$stdout.sync = true
arguments = ARGV

@vault = arguments[0]
@url = arguments[1]
sot = arguments[2]
@missing = ""
@located = ""

l = "#{sot}" # file contaiing the complete list of assets. sot = source of truth
e = File.readlines(l)

def scribble(name, urls)
  open("sources/#{name}", 'w') do |f|
    f.print urls
  end
end

def existence(slug)
  if File.file?("#{@vault}/#{slug}")
    @located << "#{@url}/#{slug}\n"
  else @missing << "#{@url}/#{slug}\n"
  end
end

e.each do |line|
  if "#{line}".include? "http://"
    line[0..24] = ""
    existence(line.chomp)
  else
    line[0..25] = ""
    existence(line.chomp)
  end
end

@missing.chomp!
@located.chomp!

scribble("missing.txt", @missing)
scribble("located.txt", @located)