#!/bin/bash

# Adds a new line at the bottom of the terminal, and excludes it from the scrolling region
# Useful for static information

bottomLine() {
    clear
    # CONTENT=$@
    CONTENT=$(tr -d '\n' <<< "$@")
    # Save cursor pos
    tput sc
    # Add a new line
    tput il 1
    # Change scroll region to exclude the last lines
    tput csr 0 $(($(tput lines) - 3))
    # Move to bottom line
    tput cup $(tput lines) 0
    # Clear to the end of the line
    tput el
    # Create a header row
    echo -ne "${CONTENT}"
    # Restore cursor position
    tput rc
}
