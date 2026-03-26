CREATE TABLE nfts(
    address VARCHAR(42) PRIMARY KEY,
    name TEXT,
    symbol TEXT
);

CREATE TABLE mints(
    event_id TEXT PRIMARY KEY,
    transaction_hash TEXT,
    block_number BIGINT,
    nft_address TEXT REFERENCES nfts(address),
    token_id TEXT,
    from_address TEXT,
    to_address TEXT, 
    transaction_value BIGINT,
    time_stamp BIGINT
);

CREATE TABLE transfers(
    event_id TEXT PRIMARY KEY,
    transaction_hash TEXT,
    block_number BIGINT,
    nft_address TEXT, 
    token_id TEXT, 
    from_address TEXT, 
    to_address TEXT, 
    transaction_value NUMERIC,
    time_stamp BIGINT
);

CREATE TABLE checkpoint(
    event_type TEXT, 
    last_offset BIGINT /*last: offset*/
);

CREATE TABLE current_market_values(
    nft_address TEXT,
    token_id TEXT,
    market_value NUMERIC
);

CREATE TABLE current_owners (
    nft_address TEXT,
    token_id TEXT,
    owner TEXT 
);

CREATE TABLE market_value_distribution (
    address TEXT, 
    token_id TEXT, 
    relative_value BIGINT
);

CREATE TABLE mint_holding_times(
    days BIGINT,
    num_holds BIGINT
);

CREATE TABLE owership_transitions(
    from_address TEXT,
    to_address TEXT,
    num_transitions BIGINT
);

CREATE TABLE transfer_holding_times(
    days BIGINT,
    num_holds BIGINT
);

CREATE TABLE transfer_statistics_by_address(
    address TEXT,
    transfers_out BIGINT, 
    transfers_in BIGINT
);

CREATE TABLE transfer_values_quantile_10_distribution_per_address(
    address TEXT,
    quantiles TEXT, 
    relative_value NUMERIC
);

CREATE TABLE transfer_values_quantile_25_distribution_per_address(
    address TEXT, 
    quantiles TEXT, 
    relative_value BIGINT
);

CREATE TABLE transfer_values_quartile_10_distribution_per_address(
    address TEXT, 
    quartiles TEXT,
    relative_value BIGINT
);


CREATE TABLE transfers_mints(
    transfer_id TEXT, 
    mint_id TEXT
);