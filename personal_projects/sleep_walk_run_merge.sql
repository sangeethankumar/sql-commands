--###############################
--MERGING sleep, walk, run
--###############################

/*
Creating sleep_clean
*/
CREATE TABLE sleep_clean(
	date DATE,
	sleep NUMERIC,
	deep NUMERIC,
	light NUMERIC,
	awake NUMERIC,
	rem NUMERIC
); -- creating sleep_clean table

COPY sleep_clean
FROM '/home/sangeetha/Personal/Projects/sleep_qlty_mon/data/data_after_merging/sleep.csv' DELIMITER ',' CSV HEADER; 
-- copying values from csv

SELECT *
FROM sleep_clean; -- checking if values are copied

/*
Creating walk_clean
*/
CREATE TABLE walk_clean(
	date DATE,
	duration NUMERIC,
	calories NUMERIC,
	avgspeed NUMERIC,
	avghr NUMERIC,
	aerobic NUMERIC,
	anaerobic NUMERIC,
	fatburn NUMERIC,
	warmup NUMERIC
); -- creating walk_clean table

COPY walk_clean
FROM '/home/sangeetha/Personal/Projects/sleep_qlty_mon/data/data_after_merging/walk.csv' DELIMITER ',' CSV HEADER; 
-- copying values from csv

SELECT *
FROM walk_clean; -- checking if values are copied


/*
Creating run_clean
*/
CREATE TABLE run_clean(
	date DATE,
	duration NUMERIC,
	calories NUMERIC,
	avgspeed NUMERIC,
	avghr NUMERIC,
	aerobic NUMERIC,
	anaerobic NUMERIC,
	fatburn NUMERIC,
	warmup NUMERIC
); -- creating run_clean table

COPY run_clean
FROM '/home/sangeetha/Personal/Projects/sleep_qlty_mon/data/data_after_merging/run.csv' DELIMITER ',' CSV HEADER; 
-- copying values from csv

SELECT *
FROM run_clean; -- checking if values are copied

/*
MERGING
*/
SELECT 
	swclean.*,
	rclean.duration,
	rclean.calories,
	rclean.avgspeed,
	rclean.avghr,
	rclean.aerobic,
	rclean.anaerobic,
	rclean.fatburn,
	rclean.warmup
FROM 
	(SELECT 
		sclean.*,
		wclean.duration,
	 	wclean.calories,
	 	wclean.avgspeed,
	 	wclean.avghr,
	 	wclean.aerobic,
	 	wclean.anaerobic,
	 	wclean.fatburn,
	 	wclean.warmup
	FROM sleep_clean AS sclean
	LEFT JOIN walk_clean AS wclean
	ON sclean.date = wclean.date
	) AS swclean
LEFT JOIN run_clean AS rclean
ON swclean.date = rclean.date
ORDER BY swclean.date ASC;

/*
Write to csv
*/
COPY 
	(
		SELECT 
			swclean.*,
			rclean.duration,
			rclean.calories,
			rclean.avgspeed,
			rclean.avghr,
			rclean.aerobic,
			rclean.anaerobic,
			rclean.fatburn,
			rclean.warmup
		FROM 
			(SELECT 
				sclean.*,
				wclean.duration,
				wclean.calories,
				wclean.avgspeed,
				wclean.avghr,
				wclean.aerobic,
				wclean.anaerobic,
				wclean.fatburn,
				wclean.warmup
			FROM sleep_clean AS sclean
			LEFT JOIN walk_clean AS wclean
			ON sclean.date = wclean.date
			) AS swclean
		LEFT JOIN run_clean AS rclean
		ON swclean.date = rclean.date
		ORDER BY swclean.date ASC
	)
TO '/home/sangeetha/Personal/Projects/sleep_qlty_mon/data/data_after_merging/sleep_walk_run.csv' DELIMITER ',' NULL AS '' CSV HEADER ;









