#!/usr/bin/env ruby
load 'common.rb'
$stdin.flush
$stdout.flush
$stdout.sync = true
@kaboodle = ""

# Read all required files
possible = File.readlines("#{@t}possible.txt") # Output of the xbc.py program
current = File.readlines("#{@s}current.txt")
fours = File.readlines("#{@s}fours.txt")
maps = File.readlines("#{@s}maps.txt")

# Remove any duplicate entries in the possible variable
possible.uniq!

# Append everything into one variable
meld(possible)
meld(current)
meld(maps)
meld(fours)

# Print to a draft file
document("#{@t}draft.txt", @kaboodle)

# Read the newly compiled draft file
beta = File.readlines("#{@t}draft.txt")
beta.uniq!

@kaboodle = ""
meld(beta)
document("#{@t}beta.txt", @kaboodle)