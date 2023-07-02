#!/usr/bin/env ruby
load 'common.rb'
$stdin.flush
$stdout.flush
$stdout.sync = true
folder = "sources/"
@kaboodle = ""

# Read all required files
possible = File.readlines("#{folder}possible.txt") # Output of the xbc.py program
current = File.readlines("#{folder}current.txt")
fours = File.readlines("#{folder}fours.txt")
maps = File.readlines("#{folder}maps.txt")

# Remove any duplicate entries in the possible variable
possible.uniq!

# Append everything into one variable
meld(possible)
meld(current)
meld(maps)
meld(fours)

# Print to a draft file
scribble("draft.txt", @kaboodle)

# Read the newly compiled draft file
beta = File.readlines("#{folder}draft.txt")
beta.uniq!

@kaboodle = ""
meld(beta)
scribble("beta.txt", @kaboodle)