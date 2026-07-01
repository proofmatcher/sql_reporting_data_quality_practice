/*
Basic reporting queries for sample records.
*/

SELECT
    COUNT(*) AS total_records,
    SUM(needs_review) AS records_needing_review,
    ROUND(100.0 * SUM(needs_review) / COUNT(*), 1) AS review_rate_percent
FROM sample_voter_records;

SELECT
    registration_status,
    COUNT(*) AS record_count
FROM sample_voter_records
GROUP BY registration_status
ORDER BY record_count DESC;

SELECT
    reported_district,
    COUNT(*) AS total_records,
    SUM(needs_review) AS records_needing_review,
    ROUND(100.0 * SUM(needs_review) / COUNT(*), 1) AS review_rate_percent
FROM sample_voter_records
GROUP BY reported_district
ORDER BY records_needing_review DESC;

SELECT
    source_file,
    COUNT(*) AS total_records,
    SUM(needs_review) AS records_needing_review,
    ROUND(100.0 * SUM(needs_review) / COUNT(*), 1) AS review_rate_percent
FROM sample_voter_records
GROUP BY source_file
ORDER BY review_rate_percent DESC;
