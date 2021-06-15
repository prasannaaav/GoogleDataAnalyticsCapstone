create table #weight(id bigint,Activedays int)
insert into #weight(id,Activedays)
select id, count(*) as Weight_watchers from weightLogInfo group by id;

WITH MedianTab (MedianWt)
AS
(SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Activedays)
OVER () as MedianWeight
FROM #weight)
,
DispersionTab (AbsDispersion)
AS
(SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY (Abs(Activedays-MedianWt)))
OVER () as AbsDispersion
FROM MedianTab JOIN #weight on 1=1)
select * from (Select DISTINCT *,ABS((Activedays-MedianWt)/AbsDispersion) as ABSL FROM #weight  Join DispersionTab on 1=1
JOIN MedianTab on 1=1) wei where activedays<5
