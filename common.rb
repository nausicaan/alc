#!/usr/bin/env ruby
$stdin.flush
$stdout.flush
$stdout.sync = true

# Common variables
@s = "sources/"
@r = "results/"
@t = "temp/"

# Create new files or overwite existing ones
def scribble(name, urls)
  open("#{name}", 'w') do |f|
    f.print urls
  end
end

# Print values to a named file
def amalgamate(list, target)
  list.each do |line|
    target.print(line)
  end
end

# Append values to the @kaboodle variable
def meld(read)
  read.each do |line|
    @kaboodle << line
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