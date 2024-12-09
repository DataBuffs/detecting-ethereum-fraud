# Detecting Malicious Behaviors on Ethereum

#### Group 7 (the DataBuffs)<br>
BD Tinsley<br>
Hallee Ray<br>

CSPB 4502<br>
CU Fall 2024<br>

## Navigating the Repository

### Data
The data folder is empty due to memory restrictions.
In order to run our notebooks, copy the repository into your local environment and download our data from [HERE](https://drive.google.com/file/d/1kFCydATvDrgzM55FABZuJysAZesSnjpp/view?usp=sharing). NOTE: This zip file is 5GB, the unzipped folder is nearly 10GB.<br>
Optionally, you can pull a new data subset directly by following the directions to pull Ethereum transactions locally. NOTE: Requires paid subscription


### Milestones
The milestones folder contains subdirectories for each deliverable milestone.
All of the files related to each milestone is contained within its directory.
A copy of PDFs for each milestone can be located within the root level directory following the naming convention '07_DetectingMaliciousBehaviorsOnEthereum_Part#.pdf'.

### Scripts
The scrips contained in this directory automate the process of pulling transaction data from the Ethereum ledger.

### main.ipynb
This is the jupyter notebook containing all of our code.
This notebook can be run with different data subsets to analyze transaction data from different time periods.

### main_alt.ipynb
This notebook is a condensed verion of main.ipynb.
This notebook trains and visualizes K-Means models without having to run all of the cells in main.ipynb.


## Project Description
The goal of our project was to elucidate a set of criteria that could potentially indicate fraudulent activity in Ethereum trading. By analyzing historical Ethereum transaction data, we aimed to generate models that could identify if a wallet was likely fraudulent or not.. With the rise of cryptocurrency, there is increasing concern regarding its validity and safety. Many scams and fraudulent activity have been reported and monitored, however, due to the decentralized and unregulated nature of cryptocurrency fraud and scams are common. 

## Questions
The questions that we sought to answer with our data mining process were aimed at understanding Ethereum transactions and building characterizations for Ethereum wallets. The goal of our project was to identify which wallets engage in fraudulent behavior. By creating a set of criteria for wallets that allow us to characterize them as likely fraudulent or not, we hoped to gain an understanding of uncommon behaviors to watch out for when analyzing transactions.

1. Are there any interesting correlations between features?
2. Are there any trends in how many transactions are executed per day across time?
3. What is the expected range of transaction values for specific time periods?
4. What wallets make the most transactions, and how often?

We hoped that by analyzing these specific questions, we would be able to gain a deeper understanding of Ethereum transactions and wallet behaviors and improve our ability to predict whether a transaction is likely to be fraudulent. These questions allowed us to generate several variables that we used as reference points for determining if a transaction or wallet behavior was suspicious.


## Applications
The knowledge that we gained during our data exploration and modeling provided us with insights with which we could apply to other datasets and time periods to hypothesize whether any transactions are likely fraudulent. With additional information regarding known fraudulent activity, we could extend our modeling to include supervised models that could classify a transaction as fraudulent or not, instead of describing the transaction in terms of activity and behavior. 

Future applications of the knowledge gained in this project includes generating a flagging system for users who trade Ethereum. Utilizing the behaviors and typical behaviors for wallets, we could generate a warning message for users who are about to engage in activity with wallets that are outside of the expected behavior of historical transactions as well as activity types for the specific wallet. 

## Final Presentation
[Final Presentation Video](https://github.com/DataBuffs/detecting-ethereum-fraud/blob/main/07_DetectingMaliciousBehaviorsOnEthereum_Part6_video.mp4)

## Final Project Paper
[Final Report](https://github.com/DataBuffs/detecting-ethereum-fraud/blob/main/07_DetectingMaliciousBehaviorsOnEthereum_Part4.pdf)




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

