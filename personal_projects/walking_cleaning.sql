--###############################
--CLEANING walking
--###############################

/*
Taking a look into the database
*/
SELECT *
FROM walking;

/*
Converting date column from varchar to date
*/
SELECT TO_DATE(date,'DD-MM-YYYY') as date
FROM walking; --test change date column to date type

/*
Extracting hours, mins, seconds from duration
*/
SELECT 
	duration,
	TO_NUMBER(SUBSTRING(duration,1,1),'99') AS hours, --hours
	TO_NUMBER(SUBSTRING(duration,3,2),'99') AS mins, --minutes
	TO_NUMBER(SUBSTRING(duration,6,2),'99') AS sec --seconds
FROM walking;

/*
converting duration to minutes
*/
SELECT 
	duration,
	TO_NUMBER(SUBSTRING(duration,1,1),'99')*60 AS h2m,
	TO_NUMBER(SUBSTRING(duration,3,2),'99') AS mins,
	TO_NUMBER(SUBSTRING(duration,6,2),'99')/60 AS s2m,
	ROUND(TO_NUMBER(SUBSTRING(duration,1,1),'99')*60 + TO_NUMBER(SUBSTRING(duration,3,2),'99') + TO_NUMBER(SUBSTRING(duration,6,2),'99')/60) AS duration_mins
FROM walking; --unit test

/*
output data
*/
COPY
 (SELECT 
	 TO_DATE(date,'DD-MM-YYYY') as date,
	 ROUND(TO_NUMBER(SUBSTRING(duration,1,1),'99')*60 + TO_NUMBER(SUBSTRING(duration,3,2),'99') + TO_NUMBER(SUBSTRING(duration,6,2),'99')/60) AS duration,
	 calories,
	 avgspeed,
	 avghr,
	 aerobic,
	 anaerobic,
	 fatburn,
	 warmup
 FROM walking)
TO '/home/sangeetha/Personal/Projects/sleep_qlty_mon/data/data_after_merging/walk.csv' DELIMITER ',' NULL AS '' CSV HEADER;
