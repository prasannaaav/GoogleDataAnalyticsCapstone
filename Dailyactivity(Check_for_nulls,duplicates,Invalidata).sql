---No nulls or emptyvalues found
select * from VW_Dailyactivity where (id is null) or (Activitydate='' or  Activitydate is null)  or (totalsteps is null or TotalSteps='') or
(totaldistance='' or totaldistance is null) or (trackerdistance is null or trackerdistance ='' ) or (LoggedActivitiesDistance is null or loggedactivitiesdistance='') or
(veryactivedistance is null or VeryActiveDistance='') or (moderatelyactivedistance is null or moderatelyactivedistance='') or  (LightActiveDistance='' or lightactivedistance is null) or
(sedentaryactivedistance is null or sedentaryactivedistance='') or (veryactiveminutes='' or VeryActiveMinutes is null) or (FairlyActiveMinutes is null or fairlyactiveminutes='') or (LightlyActiveMinutes=''or lightlyactiveminutes is null) or (sedentaryminutes is null)
or (calories is null or calories='')

---No duplicates present in the table
select count(*) from (select * from VW_Dailyactivity) DA
select count(*) from (select distinct * from VW_Dailyactivity) DA

---DATA VALIDITY WAS CHECKED WHILE IMPORTING DATA

select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='VW_Dailyactivity'