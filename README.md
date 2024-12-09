# Detecting Malicious Behaviors on Ethereum

Group 7 (the DataBuffs)
CSPB 4502
CU Fall 2024

## Navigating the Repository

### Data
The data folder is empty due to memory restrictions.
In order to run our notebooks, copy the repository into your local environment and download our data from LINK TO DRIVE<br>
Optionally, you can pull a new data subset directly by following the directions to pull Ethereum transactions locally below.


### Milestones
The milestones folder contains subdirectories for each deliverable milestone.
All of the files related to each milestone is contained within its directory.
A copy of the final report PDF can be located within the root level directory.

### Scripts
The scrips contained in this directory automate the process of pulling transaction data from the Ethereum ledger.

### main.ipynb
This is the jupyter notebook containing all of our code.
This notebook can be run with different data subsets to analyze transaction data from different time periods.

### main_alt.ipynb
This notebook is a condensed verion of main.ipynb.
This notebook trains and visualizes K-Means models without having to run all of the cells in main.ipynb.



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

