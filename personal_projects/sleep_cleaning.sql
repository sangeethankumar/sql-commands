--###############################
--CLEANING sleep
--###############################

/*
Converting date column from varchar to date
*/
SELECT TO_DATE(date,'DD-MM-YYYY') as date
FROM sleep; --test change date column to date type

/*
Converting sleep from varchar to numeric
sleeptime - minutes
*/
SELECT 
	SPLIT_PART(sleephours,'h',1) AS hour_split,
	TO_NUMBER(SPLIT_PART(sleephours,'h',1),'99') AS hours,
	TO_NUMBER(SPLIT_PART(sleephours,'h',1),'99')*60 AS minutes
FROM sleep; --test convert hours to minutes

SELECT 
	SPLIT_PART(sleephours,'h',1) AS hour_split,
	SUBSTR(SPLIT_PART(sleephours,'h',2),1,LENGTH(SPLIT_PART(sleephours,'h',2))-1) AS min_split,
	TO_NUMBER(SPLIT_PART(sleephours,'h',1),'99') AS hours,
	TO_NUMBER(SPLIT_PART(sleephours,'h',1),'99')*60 AS h2mins,
	TO_NUMBER(SUBSTR(SPLIT_PART(sleephours,'h',2),1,LENGTH(SPLIT_PART(sleephours,'h',2))-1),'99') AS minutes
FROM sleep; --test extract minutes

SELECT
	sleephours,
	SPLIT_PART(sleephours,'h',1) AS hour_split,
	SUBSTR(SPLIT_PART(sleephours,'h',2),1,LENGTH(SPLIT_PART(sleephours,'h',2))-1) AS min_split,
	TO_NUMBER(SPLIT_PART(sleephours,'h',1),'99') AS hours,
	TO_NUMBER(SPLIT_PART(sleephours,'h',1),'99')*60 AS h2mins,
	TO_NUMBER(SUBSTR(SPLIT_PART(sleephours,'h',2),1,LENGTH(SPLIT_PART(sleephours,'h',2))-1),'99') AS minutes,
	TO_NUMBER(SPLIT_PART(sleephours,'h',1),'99')*60 + TO_NUMBER(SUBSTR(SPLIT_PART(sleephours,'h',2),1,LENGTH(SPLIT_PART(sleephours,'h',2))-1),'99') AS sleeptime
FROM sleep; --test create sleeptime

/*
convert deep from varchar to numeric
deeptime - minutes
*/
SELECT 
	deep,
	SPLIT_PART(deep,'h',1) AS hour_split,
	SUBSTR(SPLIT_PART(deep,'h',2),1,LENGTH(SPLIT_PART(deep,'h',2))-1) AS min_split,
	TO_NUMBER(SPLIT_PART(deep,'h',1),'99') AS hours,
	TO_NUMBER(SPLIT_PART(deep,'h',1),'99')*60 AS h2mins,
	TO_NUMBER(SUBSTR(SPLIT_PART(deep,'h',2),1,LENGTH(SPLIT_PART(deep,'h',2))-1),'99') AS minutes,
	TO_NUMBER(SPLIT_PART(deep,'h',1),'99')*60 + TO_NUMBER(SUBSTR(SPLIT_PART(deep,'h',2),1,LENGTH(SPLIT_PART(deep,'h',2))-1),'99') AS deeptime
FROM sleep; --test create deeptime

/*
convert light from varchar to numeric
lighttime - minutes
*/
SELECT 
	light,
	SPLIT_PART(light,'h',1) AS hour_split,
	SUBSTR(SPLIT_PART(light,'h',2),1,LENGTH(SPLIT_PART(light,'h',2))-1) AS min_split,
	TO_NUMBER(SPLIT_PART(light,'h',1),'99') AS hours,
	TO_NUMBER(SPLIT_PART(light,'h',1),'99')*60 AS h2mins,
	TO_NUMBER(SUBSTR(SPLIT_PART(light,'h',2),1,LENGTH(SPLIT_PART(light,'h',2))-1),'99') AS minutes,
	TO_NUMBER(SPLIT_PART(light,'h',1),'99')*60 + TO_NUMBER(SUBSTR(SPLIT_PART(light,'h',2),1,LENGTH(SPLIT_PART(light,'h',2))-1),'99') AS lighttime
FROM sleep; --test create lighttime

/*
convert awake from varchar to numeric
awaketime - minutes
*/
SELECT 
	awake,
	SPLIT_PART(awake,'h',1) AS hour_split,
	SUBSTR(SPLIT_PART(awake,'h',2),1,LENGTH(SPLIT_PART(awake,'h',2))-1) AS min_split,
	TO_NUMBER(SPLIT_PART(awake,'h',1),'99') AS hours,
	TO_NUMBER(SPLIT_PART(awake,'h',1),'99')*60 AS h2mins,
	TO_NUMBER(SUBSTR(SPLIT_PART(awake,'h',2),1,LENGTH(SPLIT_PART(awake,'h',2))-1),'99') AS minutes,
	TO_NUMBER(SPLIT_PART(awake,'h',1),'99')*60 + TO_NUMBER(SUBSTR(SPLIT_PART(awake,'h',2),1,LENGTH(SPLIT_PART(awake,'h',2))-1),'99') AS awaketime
FROM sleep; --test create awaketime

/*
convert rem from varchar to numeric
remtime - minutes
*/
SELECT 
	rem,
	SPLIT_PART(rem,'h',1) AS hour_split,
	SUBSTR(SPLIT_PART(rem,'h',2),1,LENGTH(SPLIT_PART(rem,'h',2))-1) AS min_split,
	TO_NUMBER(SPLIT_PART(rem,'h',1),'99') AS hours,
	TO_NUMBER(SPLIT_PART(rem,'h',1),'99')*60 AS h2mins,
	TO_NUMBER(SUBSTR(SPLIT_PART(rem,'h',2),1,LENGTH(SPLIT_PART(rem,'h',2))-1),'99') AS minutes,
	TO_NUMBER(SPLIT_PART(rem,'h',1),'99')*60 + TO_NUMBER(SUBSTR(SPLIT_PART(rem,'h',2),1,LENGTH(SPLIT_PART(rem,'h',2))-1),'99') AS remtime
FROM sleep; --test create remtime

/*
relevant columns
*/
SELECT
	sleephours,
	TO_NUMBER(SPLIT_PART(sleephours,'h',1),'99')*60 + TO_NUMBER(SUBSTR(SPLIT_PART(sleephours,'h',2),1,LENGTH(SPLIT_PART(sleephours,'h',2))-1),'99') AS sleeptime,
	deep,
	TO_NUMBER(SPLIT_PART(deep,'h',1),'99')*60 + TO_NUMBER(SUBSTR(SPLIT_PART(deep,'h',2),1,LENGTH(SPLIT_PART(deep,'h',2))-1),'99') AS deeptime,
	light,
	TO_NUMBER(SPLIT_PART(light,'h',1),'99')*60 + TO_NUMBER(SUBSTR(SPLIT_PART(light,'h',2),1,LENGTH(SPLIT_PART(light,'h',2))-1),'99') AS lighttime,
	awake,
	TO_NUMBER(SPLIT_PART(awake,'h',1),'99')*60 + TO_NUMBER(SUBSTR(SPLIT_PART(awake,'h',2),1,LENGTH(SPLIT_PART(awake,'h',2))-1),'99') AS awaketime,	
	rem,
	TO_NUMBER(SPLIT_PART(rem,'h',1),'99')*60 + TO_NUMBER(SUBSTR(SPLIT_PART(rem,'h',2),1,LENGTH(SPLIT_PART(rem,'h',2))-1),'99') AS remtime	
FROM sleep -- unit test


/*
output data
*/
COPY
	(SELECT
		TO_DATE(date,'DD-MM-YYYY') as date,
		TO_NUMBER(SPLIT_PART(sleephours,'h',1),'99')*60 + TO_NUMBER(SUBSTR(SPLIT_PART(sleephours,'h',2),1,LENGTH(SPLIT_PART(sleephours,'h',2))-1),'99') AS sleeptime,
		TO_NUMBER(SPLIT_PART(deep,'h',1),'99')*60 + TO_NUMBER(SUBSTR(SPLIT_PART(deep,'h',2),1,LENGTH(SPLIT_PART(deep,'h',2))-1),'99') AS deeptime,
		TO_NUMBER(SPLIT_PART(light,'h',1),'99')*60 + TO_NUMBER(SUBSTR(SPLIT_PART(light,'h',2),1,LENGTH(SPLIT_PART(light,'h',2))-1),'99') AS lighttime,
		TO_NUMBER(SPLIT_PART(awake,'h',1),'99')*60 + TO_NUMBER(SUBSTR(SPLIT_PART(awake,'h',2),1,LENGTH(SPLIT_PART(awake,'h',2))-1),'99') AS awaketime,	
		TO_NUMBER(SPLIT_PART(rem,'h',1),'99')*60 + TO_NUMBER(SUBSTR(SPLIT_PART(rem,'h',2),1,LENGTH(SPLIT_PART(rem,'h',2))-1),'99') AS remtime	
	FROM sleep)
TO '/home/sangeetha/Personal/Projects/sleep_qlty_mon/data/data_after_merging/sleep.csv' DELIMITER ',' NULL AS '' CSV HEADER;

