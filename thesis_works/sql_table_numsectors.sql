-- Num sectors y1
SELECT num_sectors,COUNT(num_sectors)
FROM (SELECT TICID, (s01+s02+s03+s04+s05+s06+s07+s08+s09+s10+s11+s12+s13) AS num_sectors
FROM tess_y1_sector
) AS num_sector_sq
GROUP BY num_sectors 
ORDER BY num_sectors ASC

-- Num sectors y2
SELECT num_sectors,COUNT(num_sectors)
FROM (SELECT TICID, (s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26) AS num_sectors
FROM tess_y2_sector
) AS num_sector_sq
GROUP BY num_sectors 
ORDER BY num_sectors ASC

-- Creating table of num_sectors
CREATE TABLE num_sector_y1y2 AS 
	(SELECT y1,y2,(y1+y2) AS total
	FROM (SELECT t1.*, t2.*
	FROM 
		(SELECT num_sectors,COUNT(num_sectors) AS Y1
		FROM (SELECT TICID, (s01+s02+s03+s04+s05+s06+s07+s08+s09+s10+s11+s12+s13) AS num_sectors
		FROM tess_y1_sector
		) AS num_sector_sq
		GROUP BY num_sectors 
		ORDER BY num_sectors ASC) AS t1
	LEFT JOIN
	(SELECT num_sectors,COUNT(num_sectors) AS y2
		FROM (SELECT TICID, (s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26) AS num_sectors
		FROM tess_y2_sector
		) AS num_sector_sq
		GROUP BY num_sectors 
		ORDER BY num_sectors ASC) t2
	ON (t1.num_sectors = t2.num_sectors)) AS join_y1_y2)
	
	
-- Finding percentage targets per year

SELECT y1, ROUND(y1*100/t.sY1,1) AS perc_y1, y2, ROUND(y2*100/t.sY2,1) AS perc_y2, total, ROUND(total*100/t.stotal,1) AS perc_total
FROM num_sector_y1y2
CROSS JOIN (SELECT SUM(y1) AS sY1, SUM(y2) AS sY2, SUM(total) AS stotal FROM num_sector_y1y2) t