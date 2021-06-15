
---No Nulls or Empty Values found
select * from VW_sleepy_day where (id is null) or (sleepday='' or sleepday is null) or (TotalSleepRecords='' or TotalSleepRecords is null) or ( TotalMinutesAsleep is null) or (totaltimeinbed is null)
--3 duplicates found
select count(*) from (select * from VW_sleepy_day) Sleep
select count(*) from (select distinct * from VW_sleepy_day) sleep
---DATA VALIDITY WAS CHECKED WHILE IMPORTING DATA


select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='VW_sleepy_day'