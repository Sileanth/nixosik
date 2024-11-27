#!/usr/bin/env bash

# Get the latest Home Manager generation path
latest_generation=$(home-manager generations | head -2 | awk '{print $NF}')

# Verify if the generation path exists
if [[ -d "$latest_generation/specialisation/light-theme" ]]; then
    # Activate the specialization
    "$latest_generation/specialisation/light-theme/activate"
    echo "Activated specialization 'light-theme' from the latest Home Manager generation."
else
    echo "Specialization 'light-theme' not found in the latest Home Manager generation."
    exit 1
fi
