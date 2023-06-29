#!/usr/bin/env ruby
$stdin.flush
$stdout.flush
$stdout.sync = true
@folder = "sources/"
@kaboodle = ""

# Append values to the @kaboodle variable
def meld(bunch)
  bunch.each do |line|
    @kaboodle << line
  end
end

# Print values to a named file
def amalgamate(bunch, container)
  bunch.each do |line|
    container.print(line)
  end
end

# Open the source of truth (sot) and draft file for writing
sot = File.open("#{@folder}sot.txt", "w")
draft = File.open("#{@folder}draft.txt", "w")

# Read all required files
possible = File.readlines("#{@folder}possible.txt") # Output of the xbc.py program
current = File.readlines("#{@folder}current.txt")
fours = File.readlines("#{@folder}fours.txt")
maps = File.readlines("#{@folder}maps.txt")

# Remove any duplicate entries in the possible variable
possible.uniq!

# Append everything into one variable
meld(possible)
meld(current)
meld(maps)
meld(fours)

# Print to a draft file
draft.print(@kaboodle)
draft.close

# Read the newly compiled draft file
final = File.readlines("#{@folder}draft.txt")
final.uniq!

# Write the filtered values to the sot file
amalgamate(final, sot)
sot.close