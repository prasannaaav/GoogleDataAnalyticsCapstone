---data set too small to have outliers
create table #heartreate(id bigint,days_used int)
insert into #heartreate (id,days_used)
(select 
id ,count(days_used) as no_of_heartratedays
from 
(select convert(varchar(10),Time,111) as days_used,Id from heartrate_seconds group by convert(varchar(10),Time,111),id) heart_ratedays  group by id)
;
WITH MedianTab (MedianWt)
AS
(SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY days_used)
OVER () as MedianWeight
FROM #heartreate )
,
DispersionTab (AbsDispersion)
AS
(SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY (Abs(days_used-MedianWt)))
OVER () as AbsDispersion
FROM MedianTab JOIN #heartreate on 1=1)
select * from (Select DISTINCT *,ABS((days_used-MedianWt)/AbsDispersion) as ABSL FROM #heartreate  Join DispersionTab on 1=1
JOIN MedianTab on 1=1) rom where absl >=2


--the data set is too small to be utilized with the quartile method 
--id 2026352035 is dropped as it is comparitively small 