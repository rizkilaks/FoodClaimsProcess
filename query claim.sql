-- Made a new substring for claim_amount, this step is needed to remove the 'R$' characters in claim_amount.
UPDATE claims
SET claim_amount = SUBSTRING(claim_amount,3,10);

-- Changing claim_amount column to its correct data type which is numeric, by using the help of 'to_number'.
ALTER TABLE claims
ALTER COLUMN claim_amount TYPE numeric
USING TO_NUMBER(claim_amount,'999,000');

-- Making sure teach column has the correct data type as mentioned in the guide.
ALTER TABLE claims
ALTER COLUMN claim_id TYPE CHAR(255),
ALTER COLUMN time_to_close TYPE numeric,
ALTER COLUMN amount_paid TYPE numeric,
ALTER COLUMN location TYPE character(255),
ALTER COLUMN individuals_on_claim TYPE numeric,
ALTER COLUMN linked_cases TYPE boolean,
ALTER COLUMN cause TYPE character(255);

-- Replacing NULL with 'unknown'.
UPDATE claims
SET cause = COALESCE(cause,'unknown');

-- Correcting data with negative value.
UPDATE claims
SET time_to_close = 0-time_to_close
WHERE time_to_close < 0;

-- Checking false claim. Row with 0 value on individuals_on_claim column is assumed to be a false claim, so it will be ignored.
SELECT *
FROM claims
WHERE individuals_on_claim = 0;

-- time to close for each location.
SELECT time_to_close, location
FROM claims
WHERE individuals_on_claim > 0
ORDER BY time_to_close;

-- number of claim closed for a given year.
SELECT time_to_close, COUNT(claim_id) AS num_of_claim
FROM claims
WHERE individuals_on_claim > 0
GROUP BY time_to_close
ORDER BY num_of_claim DESC;

-- claim amount for each causes and location.
SELECT claim_amount, amount_paid, location, cause
FROM claims
WHERE individuals_on_claim > 0;

--

SELECT COUNT(claim_id), location
FROM claims
GROUP BY location;