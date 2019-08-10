CREATE TABLE state_codes (
	state VARCHAR(30),
	state_code VARCHAR(10)
);
	

CREATE TABLE median_state (
	state VARCHAR(30),
	year VARCHAR(10),
	median_income int
);


CREATE TABLE state_deaths (
	state VARCHAR(30),
	year VARCHAR(10),
	cause VARCHAR(100),
	deaths int
);

------ example analysis query -------
SELECT sd.state, sd.year, sd.cause, sd.deaths, md.median_income
FROM state_deaths sd
LEFT JOIN median_state md
ON md.state = sd.state
AND md.year = sd.year
WHERE sd.state = 'New Jersey'
AND sd.cause != 'All causes'
ORDER BY sd.deaths desc;