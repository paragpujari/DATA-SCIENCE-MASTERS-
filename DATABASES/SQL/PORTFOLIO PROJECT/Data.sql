--CREATE DATABASE SQL_PORTFOLIO;


USE SQL_PORTFOLIO;
-----------------------------Get all the details of CovidDeaths in order of location and date----------------------
SELECT * FROM CovidDeaths order by location, date;


-----------------------------Get all the details of CovidVaccinations in order of location and date----------------------
SELECT * FROM CovidVaccinations order by location, date;

-------------------------------Get all the details of CovidDeaths where continent is not empty---------------------------------
SELECT * FROM CovidDeaths WHERE continent IS NOT NULL order by location, date;


-------------------Get the Location, date, total_cases, new_cases, total_deaths, population for all the not null continents---------------
SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM CovidDeaths 
WHERE continent IS NOT NULL
order by location, date;


------------------------Get all the covid deaths details of the patients along with the death percentage --------------------------------
;with cte as(
SELECT location, date, total_cases, new_cases, total_deaths, new_deaths,
(total_deaths/total_cases)*100.0 as Death_Percentages
FROM CovidDeaths 
WHERE continent IS NOT NULL 
)
SELECT * FROM cte
WHERE Death_Percentages IS NOT NULL
ORDER BY location, date;


----------------------Get percentage of population infected with Covid for all the covid patients----------------------------
;with cte as(
SELECT location, date,
total_cases, population, total_deaths, new_cases, new_deaths,
(total_cases/population)*100.0 as PercentPopulationInfected
FROM CovidDeaths WHERE continent IS NOT NULL 
)
SELECT * FROM cte WHERE PercentPopulationInfected IS NOT NULL
order by PercentPopulationInfected




-- Countries with Highest Covid Cases-----------------------
;with cte as(
SELECT location, MAX(total_cases) as Highest_Infection_Cases
FROM CovidDeaths 
WHERE continent IS NOT NULL
GROUP BY location
)
SELECT * FROM cte
WHERE Highest_Infection_Cases IS NOT NULL
ORDER BY Highest_Infection_Cases DESC;


-- Countries with Highest Infection Rate compared to Population---
;with cte as(
SELECT location, population, MAX(total_cases) as Highest_Infected_Cases, 
MAX((total_cases/population))*100.0  AS PercentPopulationInfected
FROM CovidDeaths 
WHERE continent IS NOT NULL
GROUP BY location, population
)
SELECT * FROM cte
WHERE PercentPopulationInfected IS NOT NULL
ORDER BY 4 DESC;


-- Countries with Highest Death Count per Population
;with cte as(
SELECT location, MAX(CONVERT(INT,total_deaths)) as Highest_Death_Count FROM CovidDeaths 
WHERE continent IS NOT NULL
GROUP BY location
)
SELECT * FROM cte 
WHERE Highest_Death_Count IS NOT NULL
order by 2 desc;


-------------Countries with the highest Covid Death Percentage--------------------
;with cte as(
SELECT location,MAX((total_deaths/total_cases) * 100.0) as Covid_Deaths_Percentage
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
)
select * from cte
WHERE Covid_Deaths_Percentage IS NOT NULL
ORDER BY 2 DESC;


SELECT * FROM  CovidDeaths
WHERE continent IS NOT NULL AND location IN ('Iran')
