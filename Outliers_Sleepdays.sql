create table #sleep(id bigint,Activedays int)
insert into #sleep (id,Activedays)
select  id,count(SleepDay) as No_of_days_tracked from [dbo].sleepDay_merged group by Id;

WITH MedianTab (MedianWt)
AS
(SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Activedays)
OVER () as MedianWeight
FROM #sleep)
,
DispersionTab (AbsDispersion)
AS
(SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY (Abs(Activedays-MedianWt)))
OVER () as AbsDispersion
FROM MedianTab JOIN #sleep on 1=1)
select * from (Select DISTINCT *,ABS((Activedays-MedianWt)/AbsDispersion) as ABSL FROM #sleep  Join DispersionTab on 1=1
JOIN MedianTab on 1=1) rom where absl >=2
