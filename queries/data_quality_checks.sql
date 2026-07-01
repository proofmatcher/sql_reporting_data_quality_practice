/*
Data quality checks for sample records.
*/

SELECT
    voter_id,
    COUNT(*) AS row_count
FROM sample_voter_records
GROUP BY voter_id
HAVING COUNT(*) > 1
ORDER BY row_count DESC;

SELECT
    voter_id,
    first_name,
    last_name,
    address_line,
    city,
    postal_code
FROM sample_voter_records
WHERE address_line IS NULL
   OR address_line = ''
ORDER BY voter_id;

SELECT
    voter_id,
    postal_code,
    source_file
FROM sample_voter_records
WHERE invalid_postal_code_flag = 1
ORDER BY source_file, voter_id;

SELECT
    voter_id,
    reported_district,
    matched_district,
    source_file
FROM sample_voter_records
WHERE district_mismatch_flag = 1
ORDER BY reported_district, voter_id;

SELECT
    voter_id,
    last_updated,
    registration_status,
    anomaly_count
FROM sample_voter_records
WHERE stale_record_flag = 1
ORDER BY last_updated;
