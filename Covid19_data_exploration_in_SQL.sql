Select *
From PortfolioProject..CovidDeaths
Where continent is not Null
Order By 3,4

--Select *
--From PortfolioProject..CovidVaccinations
--Order By 3,4

--Select date that we are going to be using
Select Location, Date, total_cases, new_cases, total_deaths, population
From PortfolioProject..CovidDeaths
Order By 1,2

--Looking at total_cases vs total_deaths
Select Location, Date, total_cases, total_deaths, (total_deaths/total_cases)*100 As DeatehPercentage
From PortfolioProject..CovidDeaths
Where Location Like '%states%'
Order By 1,2

--Looking at total_cases vs population
--Shows what percentage of population got covid
Select Location, Date, total_cases, population, (total_cases/population)*100 As PercentPopulationInfected
From PortfolioProject..CovidDeaths
--Where Location Like '%states%'
Order By 1,2

--Looking at countries with higest infection rate compair to population
Select Location, population, Max(total_cases) as HighetInfecationCount, Max((total_cases/population))*100 As PercentPopulationInfected
From PortfolioProject..CovidDeaths
--Where Location Like '%states%'
Group By Location, population
Order By PercentPopulationInfected desc

--Showing countries with highest death count per population
Select Location, Max(Cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
--Where Location Like '%states%'
Where continent is not Null
Group By Location
Order By TotalDeathCount desc

--Break things down by continent
Select continent, Max(Cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
--Where Location Like '%states%'
Where continent is not Null
Group By continent
Order By TotalDeathCount desc

--Showing continests with the highest death per population
Select continent, Max(Cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
--Where Location Like '%states%'
Where continent is not Null
Group By continent
Order By TotalDeathCount desc

--Global Number
Select Date, Sum(new_cases) as total_cases, Sum(Cast(new_deaths as int)) as total_deaths, Sum(Cast(new_deaths as int))/Sum(new_cases)*100
as DeatehPercentage
From PortfolioProject..CovidDeaths
--Where Location Like '%states%'
Where continent is not Null
Group By date
Order By 1,2

Select Sum(new_cases) as total_cases, Sum(Cast(new_deaths as int)) as total_deaths, Sum(Cast(new_deaths as int))/Sum(new_cases)*100
as DeatehPercentage
From PortfolioProject..CovidDeaths
--Where Location Like '%states%'
Where continent is not Null
Order By 1,2


