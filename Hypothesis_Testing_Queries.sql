---Queries used for hypothesis testing
---dailyactivity table summary
select avg(mostactive) as most from (select id,sum(cast(VeryActiveMinutes as int)) as mostactive from DailyActivity group by id ) ass
select avg(fairlyactive) as fair from (select id,sum(cast(FairlyActiveMinutes as int)) as fairlyactive from DailyActivity group by id) asd
select avg(lightactive) as light from (select id,sum(cast(lightlyActiveMinutes as int)) as lightactive from DailyActivity group by id) asd
select avg(sedactive) as sed from (select id,sum(cast(SedentaryMinutes as int)) as sedactive from DailyActivity group by id) asd
 
select avg(mostactivedistance) as mostacv from (select id,sum(cast(VeryActiveDistance as float)) as mostactivedistance from DailyActivity group by id) vad
select avg(moderatelyactivedistance) as modacv from (select id,sum(cast(ModeratelyActiveDistance as float)) as moderatelyactivedistance from DailyActivity group by id)  mad
select avg(LightActiveDistance) as lightacv from (select id,sum(cast(LightActiveDistance as float)) as lightactivedistance from DailyActivity group by id ) liac


select id, calo from (select  id,avg(cast(Calories as int)) as calo from dailyactivity group by id )  dghs 
select id,steps from (select id ,avg(cast(totalsteps as int)) as steps from dailyactivity group by id) stps
---dailycalories table summary
select id, calo from (select  id,avg(cast(Calories as int)) as calo from dailyCalories group by id )  dghs where calo >2000
---daily steps table summary
select id, steps from (select  id,avg(cast(StepTotal as int)) as steps from dailysteps group by id )  stps
---heartrate seconds table summary
select id,count(id) as heartratetracked from heartrate_seconds group by id order by heartratetracked
---hourly calories table summary
select id,avg(Id) as calories from hourlyCalories group by id
---hourly intenstites summary(energy spent while exercising)
select id,avg(cast(TotalIntensity as int))as intensity from hourlyIntensities group by id
---hourly steps summary
select activityhour,sum(cast(steptotal as int)) from hourlySteps group by activityhour order by ActivityHour
select * from heartrate_seconds
select id,avg(value) as heartratetracked from heartrate_seconds group by id order by heartratetracked

---validating the relationship between daily and hourly calories

select * from [dbo].[dailyIntensities]
select * from DailyActivity
select id,count(id) from weightLogInfo  group by id
select id,avg(Calories) from [dbo].[hourlyCalories] group by id
select id,count(id) from dailyCalories group by id
select ds.id from dailyCalories ds inner join 
(select id,sum(cast(VeryActiveMinutes as int)) as mostactive from DailyActivity group by id ) asd on asd.id= ds.id
select count(steps) as No,steps as  inactivite_period from  (select count(totalsteps) as steps from (select * from VW_Dailyactivity where TotalSteps=0) step group by id )stepss group by steps
select id,steps from (select id,count(totalsteps) as steps,avg(cast(calories as int)) as calories from (select * from VW_Dailyactivity where TotalSteps=0) step group by id)steps where steps>=10
--device usage
select * from heartrate_seconds
select * from VW_Dailyactivity
select da.Id, avg(cast(TotalSteps as float)) as steps,avg(cast(hr.TotalMinutesAsleep as float)) as Totalminutesasleep,avg(cast(hr.TotalTimeInBed as float)) as Totaltimeinbed from   VW_Dailyactivity da 
inner join [dbo].[sleepDay_merged] hr on hr.id=da.id group by da.Id order by TotalMinutesAsleep desc

select id, count(id) from VW_sleepy_day group by id
select sd.Id,avg(cast(TotalMinutesAsleep as float)) as Minutesasleep,avg(cast(value as float)) as Heartrate from VW_sleepy_day sd inner join VW_heartrate hs on hs.id=sd.id group by sd.Id 


select id,avg(TotalMinutesAsleep/60) as hoursslept from sleppday_merged group by id
select *,(TotalTimeInBed/60) as hoursslept from VW_sleepy_day where (TotalTimeInBed/60) <8

select * from (select id,count(sleepday) as dayslogged,avg(TotalMinutesAsleep/60) as hoursslept, avg(totaltimeinbed/60) as timeinbed from VW_sleepy_day group by id) sleep where hoursslept>8


select * from sleepDay_merged
select id,count(id) from weightLogInfo group by id
sp_helptext Wt
select id, count(id) from wt group by id
select id, count(id) from VW_heartrate group by id
select hr.id,count(hr.Id) from VW_Dailyactivity da inner join VW_heartrate hr on da.id=hr.id group by hr.id
select hr.id,count(hr.Id) from VW_Dailyactivity da inner join VW_sleepy_day hr on da.id=hr.id group by hr.id
select hr.id,count(hr.Id) from VW_Dailyactivity da inner join wt hr on da.id=hr.id group by hr.id

select hr.id,count(hr.Id) from VW_heartrate da inner join VW_sleepy_day hr on da.id=hr.id group by hr.id
select hr.id,count(hr.Id) from VW_heartrate da inner join wt hr on da.id=hr.id group by hr.id

select hr.id,count(hr.Id) from VW_sleepy_day da inner join wt hr on da.id=hr.id group by hr.id

select id,avg(value) as heartrate from heartrate_seconds group by id order by 

---dailyactivity table summary
select avg(mostactive) as most from (select id,sum(cast(VeryActiveMinutes as int)) as mostactive from DailyActivity group by id ) ass
select avg(fairlyactive) as fair from (select id,sum(cast(FairlyActiveMinutes as int)) as fairlyactive from DailyActivity group by id) asd
select avg(lightactive) as light from (select id,sum(cast(lightlyActiveMinutes as int)) as lightactive from DailyActivity group by id) asd
select avg(sedactive) as sed from (select id,sum(cast(SedentaryMinutes as int)) as sedactive from DailyActivity group by id) asd
 
select avg(mostactivedistance) as mostacv from (select id,sum(cast(VeryActiveDistance as float)) as mostactivedistance from DailyActivity group by id) vad
select avg(moderatelyactivedistance) as modacv from (select id,sum(cast(ModeratelyActiveDistance as float)) as moderatelyactivedistance from DailyActivity group by id)  mad
select avg(LightActiveDistance) as lightacv from (select id,sum(cast(LightActiveDistance as float)) as lightactivedistance from DailyActivity group by id ) liac


select id, calo from (select  id,avg(cast(Calories as int)) as calo from dailyactivity group by id )  dghs 
select id,steps from (select id ,avg(cast(totalsteps as int)) as steps from dailyactivity group by id) stps
---dailycalories table summary
select id, calo from (select  id,avg(cast(Calories as int)) as calo from dailyCalories group by id )  dghs where calo >2000
---daily steps table summary
select id, steps from (select  id,avg(cast(StepTotal as int)) as steps from dailysteps group by id )  stps
---heartrate seconds table summary
select id,count(id) as heartratetracked from heartrate_seconds group by id order by heartratetracked
---hourly calories table summary
select id,avg(Id) as calories from hourlyCalories group by id
---hourly intenstites summary(energy spent while exercising)
select id,avg(cast(TotalIntensity as int))as intensity from hourlyIntensities group by id
---hourly steps summary
select activityhour,sum(cast(steptotal as int)) from hourlySteps group by activityhour order by ActivityHour
select * from heartrate_seconds
select id,avg(value) as heartratetracked from heartrate_seconds group by id order by heartratetracked

---validating the relationship between daily and hourly calories

select * from [dbo].[dailyIntensities]
select * from DailyActivity
select id,count(id) from weightLogInfo  group by id
select id,avg(Calories) from [dbo].[hourlyCalories] group by id
select id,count(id) from dailyCalories group by id
select ds.id from dailyCalories ds inner join 
(select id,sum(cast(VeryActiveMinutes as int)) as mostactive from DailyActivity group by id ) asd on asd.id= ds.id

----finding  the common users between features
;with 
heartrate as 
(select 
id ,count(days_used) as no_of_heartratedays
from 
(select convert(varchar(10),Time,111) as days_used,Id from heartrate_seconds where id<>2026352035) VW_heartrate  group by id),
dailyactivity as
(select id,No_of_days_tracked from (select  id,count(ActivityDate) as No_of_days_tracked from VW_Dailyactivity group by Id) daily),
sleepdays as
(select distinct  Id,count(SleepDay) as no_of_sleepdays from VW_sleepy_day group by Id),
weightdays as 
(select id,count(days_used) No_weight_tracked from (select convert(varchar(10),date,111) as days_used,Id from wt) weight group by id)
select hr.id,count(hr.Id) as powerusers from heartrate hr 
inner join  dailyactivity da on da.id=hr.id
inner join  sleepdays sd on sd.id=hr.id
inner join   wt wd on wd.id=sd.Id group by hr.id


