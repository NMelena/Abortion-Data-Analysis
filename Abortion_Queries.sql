

select *
from US_Abortion_Data..Guttmacher_United_States_Data


--US States sorted by the % of total abortions within each state as of 2017
select [U#S# State], [% of all U#S# abortions, by state of occurrence, 2017] 
from US_Abortion_Data..Guttmacher_United_States_Data
order by [% of all U#S# abortions, by state of occurrence, 2017] desc


--Sorts States based on what % of women aged 15-44 had and abortion in 2017 and what state the are living in
select 
	[U#S# State],
    [No# of abortions, by state of residence, 2017 (11)] /[Total no# of women aged 15-44, 2017] *100 as '%_Rate_of_abortions'
from US_Abortion_Data..Guttmacher_United_States_Data
order by '%_Rate_of_abortions' desc


--Sorts the States bases on % of women aged 15-44 living in a county without a clinic then and shows the %_Rate_of_abortions in that state
Select 
	[U#S# State],
	[% of women aged 15-44 living in a county without a clinic, 2017 ],
	[No# of abortions, by state of residence, 2017 (11)] /[Total no# of women aged 15-44, 2017] *100 as '%_Rate_of_abortions'
From US_Abortion_Data..Guttmacher_United_States_Data
Order by [% of women aged 15-44 living in a county without a clinic, 2017 ] desc


--Shows Flow of women into (+) or out of (-) the state for an abortion
--If negative it shows how many people left the state to get an abortion
select 
	[U#S# State],
	[No# of abortions, by state of occurrence, 2017 (2)] - [No# of abortions, by state of residence, 2017 (11)] as [Flow of women into (+) or out of (-) the state for an abortion]
from US_Abortion_Data..Guttmacher_United_States_Data
ORDER BY [Flow of women into (+) or out of (-) the state for an abortion] DESC


--Sorts the % of women aged 18-49 using contraceptives in 2017 and then shows the % Rate of abortions within the same state
--Does not include states with null values for [% of women aged 18-49 using contraceptives, 2017 (3)] 
select 
	[U#S# State],
	[% of women aged 18-49 using contraceptives, 2017 (3)],
    [No# of abortions, by state of residence, 2017 (11)] /[Total no# of women aged 15-44, 2017] *100 as '%_Rate_of_abortions'
from US_Abortion_Data..Guttmacher_United_States_Data
where [% of women aged 18-49 using contraceptives, 2017 (3)] is not null
order by [% of women aged 18-49 using contraceptives, 2017 (3)] desc


--Shows the number of teen abortions by state per 1,000,000
--Does not include states with null values for [No# of pregnancies among women younger than 15, by state of resi] and [No# of abortions among women aged 15-17, by state of residence, ]
select 
	[U#S# State],
	([No# of abortions among women younger than 15, by state of reside]+[No# of abortions among women aged 15-17, by state of residence, ]) / [Total no# of women aged 15-44, 2017] * 1000000 as Teen_Abortions_Per_1000000_Women_of_Childbearing_Age
From US_Abortion_Data..Guttmacher_United_States_Data
where 
	 [No# of abortions among women aged 15-17, by state of residence, ] is not null
	 and [No# of abortions among women younger than 15, by state of reside] is not null
order by Teen_Abortions_Per_1000000_Women_of_Childbearing_Age desc


--Teen pregnancies per 1000000 of childbearing age
Select 	
	[U#S# State],
	([No# of pregnancies among women younger than 15, by state of resi] + [No# of pregnancies among women aged 15-17, by state of residence]) / [Total no# of women aged 15-44, 2017] * 1000000 as Teen_Pregnancies_Per_1000000_Women_of_Childbearing_Age
From US_Abortion_Data..Guttmacher_United_States_Data
Where [No# of pregnancies among women younger than 15, by state of resi] is not null
	  and [No# of pregnancies among women aged 15-17, by state of residence] is not null
Order by Teen_Pregnancies_Per_1000000_Women_of_Childbearing_Age desc


