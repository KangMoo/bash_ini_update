#!/bin/bash

# Function to change value in ini file
function update_config() {
  local ini_file="$1"
  local section="$2"
  local key="$3"
  local new_value="$4"

  awk -F= -v section="$section" -v key="$key" -v new_value="$new_value" '
  BEGIN { in_section = 0; changed = 0 }
  /^\[.*\]$/ {
    if (in_section) {
      if (!changed) {
        printf("%s = %s\n", key, new_value)
      }
      in_section = 0
    } else {
      in_section = (index($0, section) > 0)
    }
  }
  in_section && match($1, "^" key) {
    printf("%s= %s\n", $1, new_value)
    changed = 1
    next
  }
  { print }
  END {
    if (!changed && in_section) {
      printf("%s = %s\n", key, new_value)
    }
  }' "$ini_file" > temp.ini && mv temp.ini "$ini_file"
}
