--portfolio Project
--a. Datawise Likelihood of dying due to Covid- Total cases vs TotalDeath- In India
select date,total_cases,total_deaths from "CovidDeaths" where location like '%India%'

--b.Total % of deaths out of entire population in india

select (max(total_deaths)/avg(cast(population as integer))*100) from "CovidDeaths" where location like '%India%'
select total_deaths,population from "CovidDeaths" where location like '%India%'

-- d. Country with highest death as % of total population

select location,(max(total_deaths)/avg(cast(population as bigint))*100) as percentage from "CovidDeaths" group by location order by percentage desc; 

-- e. Total % of Covid  +ve cases in India

select (max(total_cases)/avg(cast(population as bigint))*100) as percentagepositive from "CovidDeaths" where location like '%India%'

--f.Total % of covid +ve cases in world

select location,(max(total_cases)/avg(cast(population as bigint))*100) as percentagepositive from "CovidDeaths" group by location order by percentagepositive desc;

-- g.Continentwise +ve cases

select location, max(total_cases) as total_case from "CovidDeaths" where continent is null group by location order by total_case desc;

--h.continent wise deaths

select location, max(total_deaths) as total_death from "CovidDeaths" where continent is null group by location order by total_death desc;

--i. Countrywise age 65>

select "CovidDeaths" .location,"Covidvaccinations".aged_65_older from "CovidDeaths" join "Covidvaccinations" on "CovidDeaths".iso_code="Covidvaccinations".iso_code and "CovidDeaths".date="Covidvaccinations".date
 --j. Countary wise total vaccinated persons
select "CovidDeaths".location as countary, (max("Covidvaccinations".people_fully_vaccinated)) as fully_vaccinated from  "CovidDeaths" join "Covidvaccinations" on "CovidDeaths".iso_code="Covidvaccinations".iso_code and "CovidDeaths".date="Covidvaccinations".date where "CovidDeaths".continent is not null group by countary order by fully_vaccinated  








 




