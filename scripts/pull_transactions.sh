#!/usr/bin/env bash

# Get the directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Change to the project root directory (assuming scripts is directly under the root)
cd "$SCRIPT_DIR/.." || exit 1

# Define paths
ENV_FILE=".env"
DATA_DIR="data"
BLOCKS_FILE="$DATA_DIR/blocks.csv"
TRANSACTIONS_FILE="$DATA_DIR/transactions.csv"

echo "Current working directory: $(pwd)"

# Check if .env file exists
if [ ! -f "$ENV_FILE" ]; then
    echo "Error: .env file not found. Please run create_env.sh first."
    exit 1
fi

# Source the .env file to get the INFURA_API_KEY
source "$ENV_FILE"

# Check if INFURA_API_KEY is set
if [ -z "$INFURA_API_KEY" ]; then
    echo "Error: INFURA_API_KEY is not set in .env file."
    exit 1
fi

# Create data directory if it doesn't exist
mkdir -p "$DATA_DIR"

# Run the ethereumetl export command
echo "Pulling Ethereum transactions..."
ethereumetl export_blocks_and_transactions --start-block 0 --end-block 500000 \
--provider-uri https://mainnet.infura.io/v3/$INFURA_API_KEY \
--blocks-output $BLOCKS_FILE --transactions-output $TRANSACTIONS_FILE

echo "Blocks saved to $BLOCKS_FILE"
echo "Transactions saved to $TRANSACTIONS_FILE"