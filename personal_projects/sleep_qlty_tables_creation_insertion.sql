--###############################
--CREATING DATABASES
--###############################

/*
walking database
*/
CREATE TABLE walking(
	date VARCHAR,
	duration VARCHAR,
	calories NUMERIC,
	avgspeed NUMERIC,
	avghr NUMERIC,
	aerobic NUMERIC,
	anaerobic NUMERIC,
	fatburn NUMERIC,
	warmup NUMERIC
); -- creating walking table

COPY walking
FROM '/home/sangeetha/Personal/Projects/sleep_qlty_mon/data/DataAnalysis Project - WalkingNOISE.csv' DELIMITER ',' CSV HEADER; 
-- copying values from csv

SELECT *
FROM walking; -- checking if values are copied

/*
running database
*/
CREATE TABLE running(
	date VARCHAR,
	duration VARCHAR,
	calories NUMERIC,
	avgspeed NUMERIC,
	avghr NUMERIC,
	aerobic NUMERIC,
	anaerobic NUMERIC,
	fatburn NUMERIC,
	warmup NUMERIC
); -- creating running table

COPY running
FROM '/home/sangeetha/Personal/Projects/sleep_qlty_mon/data/DataAnalysis Project - RunningNOISE.csv' DELIMITER ',' CSV HEADER; 
-- copying values from csv

SELECT *
FROM running; -- checking if values are copied

/*
sleep database
*/
CREATE TABLE sleep(
	date VARCHAR,
	sleephours VARCHAR,
	deep VARCHAR,
	light VARCHAR,
	awake VARCHAR,
	rem VARCHAR
); -- creating sleep table

COPY sleep
FROM '/home/sangeetha/Personal/Projects/sleep_qlty_mon/data/DataAnalysis Project - SleepNOISE.csv' DELIMITER ',' CSV HEADER; 
-- copying values from csv

SELECT *
FROM sleep; -- checking if values are copied
