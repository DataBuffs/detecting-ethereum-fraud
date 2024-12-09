import pandas as pd

def clean_data(transaction_file):
    '''
    Updates data with engineered features
    from a transaction file name

    @Params: 
    transaction_file - the name of the file in the data/ directory
    @Returns:
    A dataframe
    '''
    df = pd.read_csv(f'data/{transaction_file}')

    df['value'] = df['value'].astype(float)
    df['value_ether'] = df['value'] / (10 ** 18)
    # Create new features based on frequency and value of transactions
    from_frequency = df['from_address'].value_counts()
    to_frequency = df['to_address'].value_counts()

    # Create new features based on total value of transactions
    from_val_total = df.groupby('from_address')['value_ether'].sum()
    to_val_total = df.groupby('to_address')['value_ether'].sum()

    # Create new dataframe with frequency and value features
    return_df = pd.DataFrame({
        'from_frequency': from_frequency,
        'to_frequency': to_frequency,
        'from_val_total': from_val_total,
        'to_val_total': to_val_total
    }).fillna(0)

    # Create new feature for total frequency of transactions
    return_df['total_frequency'] = return_df['from_frequency'] + return_df['to_frequency']
    return_df['avg_value_sent'] = (return_df['from_val_total'] / return_df['from_frequency']).fillna(0)
    return_df['avg_value_received'] = (return_df['to_val_total'] / return_df['to_frequency']).fillna(0)


    # Create new features based on total gas for transactions
    return_df['from_gas_total'] = df.groupby('from_address')['gas'].sum()
    return_df['to_gas_total'] = df.groupby('to_address')['gas'].sum()

    # Create new features for gas
    return_df['avg_gas_sent'] = df.groupby('from_address')['gas'].mean()
    return_df['avg_gas_price_sent'] = df.groupby('from_address')['gas_price'].mean() / (10**18) # converts GWEI to ETH
    return_df['avg_gas_received'] = df.groupby('to_address')['gas'].mean()
    return_df['avg_gas_price_received'] = df.groupby('to_address')['gas_price'].mean() / (10**18) # converts GWEI to ETH

    return_df.fillna(0, inplace=True)
  
    return return_df