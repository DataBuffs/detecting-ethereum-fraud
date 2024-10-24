#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Change to the project root directory (assuming scripts is directly under the root)
cd "$SCRIPT_DIR/.." || exit 1

# Define the path to the .env file
ENV_FILE=".env"

echo "Checking for .env file at: $ENV_FILE"

if [ -f "$ENV_FILE" ]; then
  echo ".env file found"
  if grep -q "^INFURA_API_KEY=" "$ENV_FILE"; then
    echo "INFURA_API_KEY is already set in .env. Exiting."
    exit 0
  else
    echo "INFURA_API_KEY not found in existing .env file"
  fi
else
  echo ".env file not found, creating it"
  # If the .env file doesn't exist, create it
  touch "$ENV_FILE"
  echo ".env file created in the top-level directory."
fi

# Prompt the user for their Infura API key
echo "Enter your INFURA_API_KEY:"
read INFURA_API_KEY

# Append the INFURA_API_KEY to the .env file
echo "INFURA_API_KEY=$INFURA_API_KEY" >> "$ENV_FILE"
echo "INFURA_API_KEY added to .env file."

exit 0