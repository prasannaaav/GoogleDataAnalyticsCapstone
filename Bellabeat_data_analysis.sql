---Queries used for visualization
	
---Acitive minutes
select avg(mostactive) as most from (select id,sum(cast(VeryActiveMinutes as int)) as mostactive from VW_Dailyactivity group by id ) most
select avg(fairlyactive) as fair from (select id,sum(cast(FairlyActiveMinutes as int)) as fairlyactive from VW_Dailyactivity group by id) fair
select avg(lightactive) as light from (select id,sum(cast(lightlyActiveMinutes as int)) as lightactive from VW_Dailyactivity group by id) light
select avg(sedactive) as sed from (select id,sum(cast(SedentaryMinutes as int)) as sedactive from VW_Dailyactivity group by id) sed
 
--- Inactive streak
select id,count(id) as Incative_streak from VW_Dailyactivity where totalsteps=0 group by id


---hourslept
select * from (select id,count(sleepday) as dayslogged,avg(TotalMinutesAsleep/60) as hoursslept, avg(totaltimeinbed/60) as timeinbed from VW_sleepy_day group by id) sleep where hoursslept>8

select * from (select id,count(sleepday) as dayslogged,avg(TotalMinutesAsleep/60) as hoursslept, avg(totaltimeinbed/60) as timeinbed from VW_sleepy_day group by id) sleep where hoursslept<8

