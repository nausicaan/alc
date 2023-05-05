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

def write_file(name, urls)
  open("prompts/#{name}", 'w') do |f|
    f.print urls
  end
end

def test_reality(slug)
  if File.file?("#{@vault}/#{slug}")
    @located << "#{@url}/#{slug}\n"
  else @missing << "#{@url}/#{slug}\n"
  end
end

e.each do |line|
  if "#{line}".include? "http://"
    line[0..24] = ""
    test_reality(line.chomp)
  else
    line[0..25] = ""
    test_reality(line.chomp)
  end
end

@missing.chomp!
@located.chomp!

write_file("missing.txt", @missing)
write_file("located.txt", @located)