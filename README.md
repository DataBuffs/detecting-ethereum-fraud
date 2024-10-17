# Detecting Malicious Behaviors on Ethereum

Group 7 (the DataBuffs)
CSPB 4502
CU Fall 2024


## Dataset

The dataset is provided from the [Ethereum Cryptocurrency](https://console.cloud.google.com/marketplace/details/ethereum/crypto-ethereum-blockchain) BigQuery public dataset. Most of our work will be done using `data/transactions.csv` however, all data is included.

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

### Installing new packages

The packages listed in the project proposal have already been installed in the project. You should have already installed them by running the `pip install -r requirements.txt` command above. If you need to install more packages:

1. Insure you have access to the `install_package.sh` file:

    ```
    chmod +x install_dep.sh
    ```

1. Run the `install_package.sh` script from the root level of this project directory:

    ```
    ./install_package.sh
    ```

It will prompt you on the packages to install and adequately find the version for the purposes of this project. Conversely, if you wish to update the `requirements.txt` file yourself, feel free.

