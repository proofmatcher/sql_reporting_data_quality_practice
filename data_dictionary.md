# Data Dictionary

The dataset is simulated and uses fake records only.

## Fields

* voter_id: Fake record ID
* first_name: Simulated first name
* last_name: Simulated last name
* birth_year: Simulated birth year
* address_line: Simulated address
* city: Simulated city
* postal_code: Simulated postal code
* latitude: Simulated latitude
* longitude: Simulated longitude
* registration_status: Current status in the sample record
* reported_district: District shown in the source record
* matched_district: District matched from the sample geography fields
* source_file: Simulated source file
* last_updated: Last update date
* duplicate_id_flag: 1 means the ID appears more than once
* missing_address_flag: 1 means the address is blank
* invalid_postal_code_flag: 1 means the postal code failed a format check
* district_mismatch_flag: 1 means the reported district and matched district differ
* stale_record_flag: 1 means the record is older than the review threshold
* anomaly_count: Number of data quality checks flagged
* needs_review: 1 means the record should be reviewed
