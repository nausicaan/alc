#!/usr/bin/env ruby
$stdin.flush
$stdout.flush
$stdout.sync = true
draft = File.open("sources/draft.txt", "w") # Open the draft file for writing
sot = File.open("sources/sot.txt", "w") # Open the source of truth (sot) file for writing

current = File.readlines("sources/current.txt") # Read the current file containing confirmed links
possible = File.readlines("sources/possible.txt") # Read the possible file containing links rendered from excel spreadsheets
fours = File.readlines("sources/fours.txt") # Read the fours file containing identified 404 errors

def amalgamate(turn, spot)
  turn.each do |line|
    spot.print(line)
  end
end

# Remove any duplicate entries
current.uniq!
possible.uniq!
fours.uniq!

amalgamate(current, draft)
amalgamate(possible, draft)
amalgamate(fours, draft)
draft.close

# Read the newly compiled draft file
final = File.readlines("sources/draft.txt")
final.uniq!  # Remove any duplicate entries
amalgamate(final, sot)
sot.close