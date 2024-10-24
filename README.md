# Detecting Malicious Behaviors on Ethereum

Group 7 (the DataBuffs)
CSPB 4502
CU Fall 2024


## Getting Set Up

### Virtual Environment
1. Create and activiate a virtual environment:
    ```
    python -m venv .venv

    # for windows:
    .venv\Scripts\activate

    # for macOS:
    source .venv/bin/activate
    ```

1. Install the required packages
    ```
    pip install -r requirements.txt
    ```

1. When done with this session, deactivate:
    ```
    deactivate
    ```

### Pulling Ethereum Transactions Locally

Due to the size of the dataset, we will not be committing it to the repo, therefore we will need to pull it down locally to each machine working on it. We will be using the `ethereum-etl` package in conjunction with the Infura API to stream the Ethereum transaction ledger locally.

1. Insure you have access to the `scripts/create_env.sh` and `scripts/pull_transactions.sh` file:

    ```
    chmod +x scripts/create_env.sh
    chmod +x scripts/pull_transactions.sh
    ```

1. Run the `create_env.sh` script from the root level of this project directory:

    ```
    ./scripts/create_env.sh
    ```

    It will ask you for your `INFURA_API_KEY`. Ask [BD](https://github.com/benjtinsley) for one or set up your own at [Infura.io](https://app.infura.io/).
    
    The `create_env` script will set up an `.env` file for environment variables and place the `INFURA_API_KEY` for later use. You can verify the key is set by opening the `.env` file in the root level of this project directory and check for the `INFURA_API_KEY` variable.
    
    __Note:__ if you set up your own Infura API key on the free plan, you will not be able to pull an adequate amount of transactions for the purposes of this project.

1. Run the `pull_transactions.sh` script from the root level of this project directory:

    ```
    ./scripts/pull_transactions.sh
    ```

    This will pull down the Ethereum transaction ledger from Infura and save it to `data/eth_transactions.csv` using the `INFURA_API_KEY` in the `.env` file.

    __Note:__ this will take several minutes to complete, but will only need to be done once.

