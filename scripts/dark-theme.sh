#!/usr/bin/env bash

# Get the latest Home Manager generation path
latest_generation=$(home-manager generations | head -1 | awk '{print $NF}')

# Verify if the generation path exists
if [[ -d "$latest_generation/specialisation/dark-theme" ]]; then
    # Activate the specialization
    "$latest_generation/specialisation/dark-theme/activate"
    echo "Activated specialization 'dark-theme' from the latest Home Manager generation."
else
    echo "Specialization 'dark-theme' not found in the latest Home Manager generation."
    exit 1
fi
