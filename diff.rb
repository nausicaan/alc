#!/usr/bin/env ruby
$stdin.flush
$stdout.flush
$stdout.sync = true

@needit = []
@ignore = []
@gotit = []
@tolook = []
@zenith = []
@lost = File.readlines("sources/lost.txt")
@found = File.readlines("sources/found.txt")

# Open the sot and misssing file for writing
missing = File.open("sources/missing.txt", "w")
sot = File.open("sources/sot.txt", "w")

# Create new files or overwite existing ones
def scribble(name, urls)
  open("sources/#{name}", 'w') do |f|
    f.print urls
  end
end

# Print values to a named file
def amalgamate(bunch, container)
  bunch.each do |line|
    container.print(line)
  end
end

# Append values to the @kaboodle variable
def meld(bunch)
  bunch.each do |line|
    @zenith.append(line)
  end
end

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

@lost.each do |line|
  isolate("#{line}")
  grep = %x[grep "#{@dumpty[@finds]}" "sources/current.txt"]
  if grep.length > 1
    @gotit.append(grep)
    @ignore.append(line)
  else
    @needit.append(@dumpty[@finds])
    @tolook.append(line)
  end
end

meld(@found)
meld(@gotit)
@zenith.uniq!
amalgamate(@zenith, sot)
amalgamate(@tolook, missing)
missing.close
sot.close