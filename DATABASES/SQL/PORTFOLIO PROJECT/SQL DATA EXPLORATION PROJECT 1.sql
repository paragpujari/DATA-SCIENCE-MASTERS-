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

-- Showing contintents with the highest death count per population---------------------------------
SELECT continent, MAX(CONVERT(INT, total_deaths)) as Highest_Death_Counts
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY 2 DESC;


--------------Get the total number of new cases, new deaths and new Death Percentage-------------------------------------------
SELECT 
SUM(CONVERT(INT,new_cases)) as total_new_cases,
SUM(CONVERT(INT,new_deaths)) AS total_new_deaths,
SUM(CONVERT(NUMERIC(18,5),new_deaths))/SUM(CONVERT(NUMERIC(18,5),new_cases))*100.0 AS new_Death_Percentage
FROM CovidDeaths
WHERE continent IS NOT NULL;



-- Shows Percentage of Population that has recieved at least one Covid Vaccine-----------------------------------
;with cte as(
SELECT a.location, a.date, a.population, b.new_vaccinations,
SUM(CONVERT(INT,a.new_vaccinations))OVER(PARTITION BY a.location ORDER BY a.location, a.date) AS New_Covid_Vaccinations
FROM CovidDeaths a
JOIN CovidVaccinations b
ON a.location = b.location
AND a.date = b.date
WHERE a.continent IS NOT NULL 
)
SELECT *,(New_Covid_Vaccinations/population)*100.0 AS PercentagePopulationCovid 
FROM cte
WHERE new_vaccinations IS NOT NULL
ORDER BY location, date;


-- Using Temp Table to perform Calculation on Partition By in previous query
DROP TABLE IF EXISTS #temp;

;with cte as(
SELECT a.continent, a.location, a.date, a.population, b.new_vaccinations,
SUM(CONVERT(INT,b.new_vaccinations))OVER(PARTITION BY a.location ORDER BY a.location, a.date) as New_Vaccinations_For_Population_Received 
FROM CovidDeaths  a
JOIN CovidVaccinations b
ON a.location = b.location
AND a.date    = b.date
WHERE a.continent IS NOT NULL 
AND b.new_vaccinations IS NOT NULL
)
select *,(New_Vaccinations_For_Population_Received/population)*100.0 as PercentageCovidPopulation
INTO #temp
from cte
order by 7 desc;

SELECT * FROM #temp ORDER BY location, date;

-- Creating View to store data for later visualizations

CREATE VIEW PopulationVaccinated AS
SELECT a.continent, a.location, a.date, a.population, b.new_vaccinations,
SUM(CONVERT(INT,b.new_vaccinations))OVER(PARTITION BY a.location ORDER BY a.location, a.date) as New_Vaccinations_For_Population_Received 
FROM CovidDeaths  a
JOIN CovidVaccinations b
ON a.location = b.location
AND a.date    = b.date
WHERE a.continent IS NOT NULL 
AND b.new_vaccinations IS NOT NULL


-----------Display the View------------------------
SELECT * FROM PopulationVaccinated;