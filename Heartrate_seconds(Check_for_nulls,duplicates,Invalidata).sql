select  count(*) from VW_heartrate
select count(*) from heartrate_seconds
---No Nulls or Empty Values found
select * from Vw_heartrate where ( id is null) or (Time='' or Time is null) or (Value is null)
---No duplicates found
select count(*) from(select  * from VW_heartrate) Hearte
select count(*) from (select distinct * from VW_heartrate) Hearte
---DATA VALIDITY WAS CHECKED WHILE IMPORTING DATA


select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='VW_heartrate'