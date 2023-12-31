#!/bin/bash

# Define the dictionary file
dictionary_file="dictionary.txt"

# Check if the dictionary file exists
if [ ! -f "$dictionary_file" ]; then
  echo "Dictionary file '$dictionary_file' not found."
  exit 1
fi

# Iterate through each word in the dictionary
while read -r word; do
  # Use the find command to search for files with the current word as part of the filename
  found_files=$(find . -type f -name "*$word*" 2>/dev/null)
  
  # Check if any files were found
  if [ -n "$found_files" ]; then
    echo "Files containing '$word' found:"
    echo "$found_files"
  else
    echo "No file containing '$word' found."
  fi
done < "$dictionary_file"
