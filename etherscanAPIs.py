import requests
import json

## PRO CALL - cannot use with free Etherscan account ##
def daily_transaction_count(startdate, enddate, key):
    url = f"https://api.etherscan.io/api?module=stats&action=dailytx&startdate={startdate}&enddate={enddate}&sort=asc&apikey={key}"

    try:
        response = requests.request("GET", url)
    except requests.exceptions.RequestException as e:
        print(f"ERROR: {e}")

    return response.json()
########################################################


def total_supply(apikey):
    url = f"https://api.etherscan.io/api?module=stats&action=ethsupply&apikey={apikey}"

    try:
        response = requests.request("GET", url)
    except requests.exceptions.RequestException as e:
        print(f"ERROR: {e}")
        
    return response.json()

if __name__ == "__main__":
    apikey = "DC49BBKK2FHZ7JXV537MTVEH4ER66NX9H6"

    response = total_supply(apikey)
    print(f"Response from total_supply: {response}")
    print(response.get("result"))