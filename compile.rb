#!/usr/bin/env ruby
$stdin.flush
$stdout.flush
$stdout.sync = true
draft = File.open("sources/draft.txt", "w") # Open the draft file for writing
sot = File.open("sources/sot.txt", "w") # Open the source of truth (sot) file for writing

current = File.readlines("sources/current.txt") # Read the current file containing confirmed links
possible = File.readlines("sources/possible.txt") # Read the possible file containing links rendered from excel spreadsheets
fours = File.readlines("sources/fours.txt") # Read the fours file containing identified 404 errors

# Remove any duplicate entries
current.uniq!
possible.uniq!
fours.uniq!  

# Write content from the current file to the draft file
current.each do |line|
  draft.print(line)
end

# Append the draft file with content from the possible file
possible.each do |line|
  draft.print(line)
end

# Further append the draft file with content from the fours file
fours.each do |line|
  draft.print(line)
end

draft.close

# Read the newly compiled draft file
final = File.readlines("sources/draft.txt")
final.uniq!  # Remove any duplicate entries

final.each do |line|
  sot.print(line) # Create the source of truth (sot) file
end

sot.close