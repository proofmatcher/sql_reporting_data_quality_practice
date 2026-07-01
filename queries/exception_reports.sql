/*
Exception reports for records that need review.
*/

SELECT
    voter_id,
    registration_status,
    reported_district,
    matched_district,
    source_file,
    anomaly_count,
    anomaly_types
FROM sample_voter_records
WHERE needs_review = 1
ORDER BY anomaly_count DESC, source_file, voter_id;

SELECT
    source_file,
    SUM(duplicate_id_flag) AS duplicate_ids,
    SUM(missing_address_flag) AS missing_addresses,
    SUM(invalid_postal_code_flag) AS invalid_postal_codes,
    SUM(district_mismatch_flag) AS district_mismatches,
    SUM(stale_record_flag) AS stale_records
FROM sample_voter_records
GROUP BY source_file
ORDER BY source_file;

SELECT
    reported_district,
    SUM(duplicate_id_flag) AS duplicate_ids,
    SUM(missing_address_flag) AS missing_addresses,
    SUM(invalid_postal_code_flag) AS invalid_postal_codes,
    SUM(district_mismatch_flag) AS district_mismatches,
    SUM(stale_record_flag) AS stale_records,
    SUM(needs_review) AS records_needing_review
FROM sample_voter_records
GROUP BY reported_district
ORDER BY records_needing_review DESC;
