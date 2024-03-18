#!/bin/bash

# Get the list of keyboard IDs
keyboard_ids=$(hyprctl devices | grep "Keyboard at" | awk '{print $3}')

# Initialize an empty array to store keyboard names
keyboard_names=()

# Iterate through each keyboard ID
for id in $keyboard_ids; do
    # Fetch the keyboard names using grep and awk
    names=$(hyprctl devices | grep -A 1 "Keyboard at $id" | grep -v "Keyboard at" | awk '{print $1}')

    # Loop through each name and check if it ends with "-keyboard"
    for name in $names; do
        if [[ $name == *"-keyboard" ]]; then
            # Add the name to the array
            keyboard_names+=("$name")
        fi
    done
done

# Print the list of keyboard names
for keyboard in "${keyboard_names[@]}"; do
    # Switch layout for the keyboard device
    hyprctl switchxkblayout "$keyboard" next
done
