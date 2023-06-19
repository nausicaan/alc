#!/usr/bin/env ruby
$stdin.flush
$stdout.flush
$stdout.sync = true

f = File.open("sources/tsot.txt", "w") # Open the temporary source of truth (tsot) file for writing
g = File.open("sources/sot.txt", "w") # Open the true source of truth (sot) file for writing

s1 = File.readlines("sources/csot.txt") # Read the current source of truth (csot) file
s2 = File.readlines("sources/nsot.txt") # Read the new source of truth (nsot) file

s1.uniq!  # Remove any duplicate entries
s2.uniq!  # Remove any duplicate entries

s1.each do |line|
  f.print(line) # Append the temporary source of truth (tsot) file
end

s2.each do |line|
  f.print(line) # Further append the temporary source of truth (tsot) file
end

f.close

s3 = File.readlines("sources/tsot.txt") # Read the newly created temporary source of truth (tsot) file
s3.uniq!  # Remove any duplicate entries

s3.each do |line|
  g.print(line) # Create the source of truth (sot) file
end

g.close