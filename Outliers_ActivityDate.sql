create table #Activity(id bigint,Activedays int)
insert into #Activity (id,Activedays)
select  id,count(ActivityDate) as No_of_days_tracked from [dbo].DailyActivity group by Id
;
with orderedList AS (
SELECT
	id,
	Activedays,
	ROW_NUMBER() OVER (ORDER BY Activedays) AS row_n
FROM #Activity
),
iqr AS (
SELECT
	Activedays,
    id,
	(
		SELECT Activedays AS quartile_break
		FROM orderedList
		WHERE row_n = FLOOR((SELECT COUNT(*)
			FROM #Activity)*0.75)
			) AS q_three,
	(
		SELECT Activedays AS quartile_break
		FROM orderedList
		WHERE row_n = FLOOR((SELECT COUNT(*)
			FROM #Activity)*0.25)
			) AS q_one,
	1.5 * ((
		SELECT Activedays AS quartile_break
		FROM orderedList
		WHERE row_n = FLOOR((SELECT COUNT(*)
			FROM #Activity)*0.75)
			) - (
			SELECT Activedays AS quartile_break
			FROM orderedList
			WHERE row_n = FLOOR((SELECT COUNT(*)
				FROM #Activity)*0.25)
			)) AS outlier_range
	FROM orderedList
)

SELECT id, Activedays
FROM iqr
WHERE Activedays >= ((SELECT MAX(q_three)
	FROM iqr) +
	(SELECT MAX(outlier_range)
		FROM iqr)) OR
		Activedays <= ((SELECT MAX(q_one)
	FROM iqr) -
	(SELECT MAX(outlier_range)
		FROM iqr))

