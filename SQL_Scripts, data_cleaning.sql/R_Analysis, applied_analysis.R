SELECT COVID_19_deaths.LA_code, COVID_19_deaths.LA_name
from COVID_19_deaths
where COVID_19_deaths.LA_name = ("Shepway")

UPDATE COVID_19_deaths
set LA_name = "Folkestone and Hythe", LA_code = ("E07000112")
where COVID_19_deaths.LA_name = ("Shepway")

SELECT COVID_19_deaths.LA_name, COVID_19_deaths.LA_code
from COVID_19_deaths
where COVID_19_deaths.LA_code in ("E07000190", "E07000191")

UPDATE COVID_19_deaths
SET LA_name = "Somerset West and Taunton", LA_code = ("E07000246")
where COVID_19_deaths.LA_code in ("E07000190", "E07000191")

UPDATE COVID_19_deaths
SET LA_code = ("E07000006")
where COVID_19_deaths.LA_name in ("South Bucks")

SELECT COVID_19_deaths.LA_code, COVID_19_deaths.LA_name
from COVID_19_deaths
WHERE COVID_19_deaths.LA_code in ("E07000201", "E07000204")

UPDATE COVID_19_deaths
SET LA_code = "E07000245", LA_name = "West Suffolk"
WHERE COVID_19_deaths.LA_code in ("E07000201", "E07000204")

SELECT COVID_19_deaths.LA_code, COVID_19_deaths.LA_name
from COVID_19_deaths
WHERE COVID_19_deaths.LA_code in ("E07000205", "E07000206")

UPDATE COVID_19_deaths
SET LA_code = "E07000244", LA_name = "East Suffolk"
WHERE COVID_19_deaths.LA_code in ("E07000205", "E07000206")

UPDATE COVID_19_deaths
SET LA_code = "E07000193"
WHERE COVID_19_deaths.LA_name in ("East Staffordshire")

UPDATE COVID_19_deaths
SET LA_code = "E06000011"
WHERE COVID_19_deaths.LA_name in ("East Riding of Yorkshire")

UPDATE COVID_19_deaths
SET LA_code = "E07000152"
WHERE COVID_19_deaths.LA_name in ("East Northamptonshire")

SELECT COVID_19_deaths.LA_code, COVID_19_deaths.LA_name
from COVID_19_deaths
WHERE COVID_19_deaths.LA_code in ("E07000004", "E07000005", "E07000006", "E07000007")

UPDATE COVID_19_deaths
SET LA_code = "E06000060", LA_name = "Buckinghamshire"
WHERE COVID_19_deaths.LA_code in ("E07000004", "E07000005", "E07000006", "E07000007")
@@@@@@@
SELECT COVID_19_deaths.LA_code, COVID_19_deaths.LA_name
from COVID_19_deaths
WHERE COVID_19_deaths.LA_code in ("E07000151", "E07000154", "E07000155")

UPDATE COVID_19_deaths
SET LA_code = "E07000154"
WHERE COVID_19_deaths.LA_name in ("Northampton")

UPDATE COVID_19_deaths
SET LA_code = "E06000062", LA_name = "West Northamptonshire"
WHERE COVID_19_deaths.LA_code in ("E07000151", "E07000154", "E07000155")

SELECT COVID_19_deaths.LA_code, COVID_19_deaths.LA_name
from COVID_19_deaths
WHERE COVID_19_deaths.LA_code in ("E07000150", "E07000152", "E07000153", "E07000156")


UPDATE COVID_19_deaths
SET LA_code = "E06000061", LA_name = "North Northamptonshire"
WHERE COVID_19_deaths.LA_code in ("E07000150", "E07000152", "E07000153", "E07000156")
@@@@@@@@@@@
SELECT COVID_19_deaths.LA_code, COVID_19_deaths.LA_name
from COVID_19_deaths
WHERE COVID_19_deaths.LA_code in ("E07000187", "E07000188", "E07000189", "E07000246")


UPDATE COVID_19_deaths
SET LA_code = "E06000066", LA_name = "Somerset"
WHERE COVID_19_deaths.LA_code in ("E07000187", "E07000188", "E07000189", "E07000246")

SELECT COVID_19_deaths.LA_code, COVID_19_deaths.LA_name
from COVID_19_deaths
WHERE COVID_19_deaths.LA_code in ("E07000163", "E07000164", "E07000165", "E07000166", "E07000167", "E07000168", "E07000169")

UPDATE COVID_19_deaths
SET LA_code = "E06000065", LA_name = "North Yorkshire"
WHERE COVID_19_deaths.LA_code in ("E07000163", "E07000164", "E07000165", "E07000166", "E07000167", "E07000168", "E07000169")

SELECT COVID_19_deaths.LA_code, COVID_19_deaths.LA_name
from COVID_19_deaths
WHERE COVID_19_deaths.LA_code in ("E07000027", "E07000030", "E07000031")

UPDATE COVID_19_deaths
SET LA_code = "E06000064", LA_name = "Westmorland and Furness"
WHERE COVID_19_deaths.LA_code in ("E07000027", "E07000030", "E07000031")

SELECT COVID_19_deaths.LA_code, COVID_19_deaths.LA_name
from COVID_19_deaths
WHERE COVID_19_deaths.LA_code in ("E07000026", "E07000028", "E07000029")

UPDATE COVID_19_deaths
SET LA_code = "E06000063", LA_name = "Cumbria"
WHERE COVID_19_deaths.LA_code in ("E07000026", "E07000028", "E07000029")

select *
from not_merged
inner join Age
on not_merged.LA_code = Age.LA_code

select *
from merge_1
inner join General_health
on merge_1.LA_code = General_health.LA_code

select *
from merge_2
inner join Work_distance
on merge_2.LA_code = Work_distance.LA_code

select *
from merge_3
inner join dimensions
on merge_3.LA_code = dimensions.LA_code;

select *
from merge_4
inner join car_vans
on merge_4.LA_code = car_vans.LA_code;

SELECT
  LA_code,
  LA_name,
  Age_total,

  ROUND(total * 1000.0 / Age_total, 2) AS total_rate,

  ROUND("Aged_4_year_ and_under" * 1000.0 / Age_total, 2) AS Aged_4_years,
  ROUND("Aged_5_to_9 years" * 1000.0 / Age_total, 2) AS Aged_5_to_9,
  ROUND(Aged_10_to_15_years * 1000.0 / Age_total, 2) AS Aged_10_to_15,
  ROUND(Aged_16_to_19_years * 1000.0 / Age_total, 2) AS Aged_16_to_19,
  ROUND(Aged_20_to_24_years * 1000.0 / Age_total, 2) AS Aged_20_to_24,
  ROUND(Aged_25_to_34_years * 1000.0 / Age_total, 2) AS Aged_25_to_34,
  ROUND(Aged_35_to_49_years * 1000.0 / Age_total, 2) AS Aged_35_to_49,
  ROUND("Aged-50_to_64_years" * 1000.0 / Age_total, 2) AS Aged_50_to_64,
  ROUND(Aged_65_to_74_years * 1000.0 / Age_total, 2) AS Aged_65_to_74,
  ROUND(Aged_75_to_84_years * 1000.0 / Age_total, 2) AS Aged_75_to_84,
  ROUND(Aged_85_years_and_over * 1000.0 / Age_total, 2) AS Aged_85_plus,

  ROUND(good_health * 1000.0 / Age_total, 2) AS good_health_rate,
  ROUND(Bad_health * 1000.0 / Age_total, 2) AS bad_health_rate,

  ROUND("2km" * 1000.0 / Age_total, 2) AS "2km_rate",
  ROUND("5km_to_10km" * 1000.0 / Age_total, 2) AS "5km_to_10km_rate",
  ROUND("20km_to_30km" * 1000.0 / Age_total, 2) AS "20km_to_30km_rate",
  ROUND("40km_to_60km" * 1000.0 / Age_total, 2) AS "40km_to_60km_rate",
  ROUND("WFH" * 1000.0 / Age_total, 2) AS "WFH",

  ROUND(not_deprived * 1000.0 / Age_total, 2) AS not_deprived_rate,
  ROUND(deprived_one_dimension * 1000.0 / Age_total, 2) AS deprived_1,
  ROUND(deprived_two_dimension * 1000.0 / Age_total, 2) AS deprived_2,
  ROUND(deprived_three_dimension * 1000.0 / Age_total, 2) AS deprived_3,
  ROUND(deprived_four_dimension * 1000.0 / Age_total, 2) AS deprived_4,

  ROUND(no_car * 1000.0 / Age_total, 2) AS no_car_rate,
  ROUND(one_car_van * 1000.0 / Age_total, 2) AS one_car_rate,
  ROUND(two_car_van * 1000.0 / Age_total, 2) AS two_car_rate,
  ROUND(three_car_name * 1000.0 / Age_total, 2) AS three_car_rate

FROM Merge_data_finallll;
