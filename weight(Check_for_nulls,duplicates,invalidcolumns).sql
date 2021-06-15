---No Nulls or emptyvalues found
select * from wt where (id is  null) or (date is  null or date='') or (WeightKg is null) or (WeightPounds is null) or (BMI is null) or (LogId is null)
select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='weightloginfo'
---No duplicates found
select count(*) from (select * from wt) weight
select count(*) from (select distinct * from wt) weight

---DATA VALIDITY WAS CHECKED WHILE IMPORTING DATA