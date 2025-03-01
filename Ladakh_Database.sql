-- Table 1:Land usages - No.of land Holdings size-wise
CREATE TABLE land_distribution (
    Years INT PRIMARY KEY,
    class_and_size VARCHAR(100),
    area_ha FLOAT,
    area_percentage FLOAT,
    no_of_holdings INT,
    holdings_percentage FLOAT
);

-- Table 2: Land usages - Rate of Urbanization
CREATE TABLE urbanization_rates (
    Years INT PRIMARY KEY,
    Rural_Urban VARCHAR(50),
    Leh_District_percen FLOAT,
    kargil_district_percentage FLOAT,
    ladakh_percentage FLOAT,
    rate_urbanization_leh FLOAT,
    rate_urbanization_kargil FLOAT,
    rate_urbanization_ladakh FLOAT
);

-- Table 3: Land usages - Total Reporting Area
CREATE TABLE land_use (
    Years INT PRIMARY KEY,
    Area_ha FLOAT,
    area_not_for_cultivation FLOAT,
    cultivable_wasteland_excluding_fallow FLOAT,
    fallow_land FLOAT,
    net_area_sown FLOAT,
    area_sown_more_than_once FLOAT,
    total_cropped_area FLOAT,
    forest_area_sq_km FLOAT
);

-- Table 4: Miscelleanous - Extreme Weather Events 
CREATE TABLE natural_events (
    Years INT PRIMARY KEY,
    Event_Type VARCHAR(100),
    Affected_Area_sqkm FLOAT,
    Causalities INT
);

-- Table 5: Miscelleanous - Land Holdings 
CREATE TABLE agricultural_land (
    Years INT PRIMARY KEY,
    Class_and_Size VARCHAR(100),
    Area_ha FLOAT,
    area_percentage FLOAT,
    Holdings INT,
    holdings_percentage FLOAT
);

-- Table 6: Miscelleanous - Land Usage patterns 
CREATE TABLE land_categories (
    Years INT PRIMARY KEY,
    Area_ha FLOAT,
    Area_Not_for_Cultivation FLOAT,
    Cultivable_Wasteland_Excluding_Fallow FLOAT,
    Fallow_Land FLOAT,
    Net_Area_Sown FLOAT,
    Area_Sown_More_than_Once FLOAT,
    Total_Cropped_Area FLOAT
);

-- Table 7: Miscelleanous - Pollution Data
CREATE TABLE pollution (
    Years INT PRIMARY KEY,
    Pollution_typess VARCHAR(100),
    Pollution_levels VARCHAR(100),
	CO2_emissions_tons FLOAT,
	Water_pollution_indexed FLOAT,
	Chemical_concentration_ppm FLOAT
);

-- Table 8:Miscelleanous - Resource Consumption Data
CREATE TABLE resource_consumption (
    Years INT PRIMARY KEY,
    Water_consumption_ltr FLOAT,
    Fuel_Consumption_ltr FLOAT,
    Energy_consumption_kwh FLOAT
);

-- Table 9:Miscelleanous - Road length by category
CREATE TABLE road_infrastructure_development (
    Years INT PRIMARY KEY,
    road_category VARCHAR(100),
    road_lengthKM FLOAT,
    land_used FLOAT,
    tourism_facilities INT
);

-- Table 10:Miscelleanous - Tourism Trend
CREATE TABLE tourism_statistics (
    Years INT PRIMARY KEY,
    foreigner_tourists INT,
    domestic_tourists INT,
    total INT
);

-- Table 11:Miscelleanous - Waste Management Data
CREATE TABLE waste_management (
    Years INT PRIMARY KEY,
    Waste_Generateed FLOAT,
    Waste_Disposal_methods VARCHAR(50),
    Waste_treatment_capacity FLOAT
);

-- Table 12:Bio-Diversity Data
CREATE TABLE livestock_population (
    Years INT PRIMARY KEY,
    Cattle INT,
    Yak_X_Cow_Hybrids INT,
    Yak_and_Other INT,
    Goat INT,
    Sheep INT,
    Horse INT,
    Donkey INT,
    Mule INT,
    Camel INT,
    Poultry INT,
    Pigs INT,
    Rabbits INT,
    Dog INT,
    Cat INT,
    Duck INT,
    Total INT
);

-- Table 13:Endangered & Vulnerable - Endangered & Vulnerable 
--CREATE TABLE Endangered_population (
	--cattle VARCHAR(100) PRIMARY KEY,
	--endangered_status INT,
	--protected_status INT,
	--restoration_project_on INT
--);

-- Table 14:Temperature Change Data
CREATE TABLE monthly_temperature_change (
	Months VARCHAR(100) PRIMARY KEY,
	Avg_Temperature_C INT,
	Min_Temperature_C INT,
	Max_Temperature_C INT,
	Precipitation_rainfall INT,
	Humidity INT,
	Rainy_days INT,
	Avg_Sun_hours INT
);

-- Table 15:Temperature Change - Mean of Precipitation (Rainfall)
CREATE TABLE Rainfall_Precipitation(
	Years INT PRIMARY KEY,
	January INT,
	February INT,
	March INT,
	April INT,
	May INT,
	June INT,
	July INT,
	August INT,
	September INT,
	October INT,
	November INT,
	December INT	
);

-- Table 16:Temperature Change - Mean of Precipitation (Snowfall) )
CREATE TABLE Snowfall_Precipitation (
	Years INT PRIMARY KEY,
	January INT,
	February INT,
	March INT,
	April INT,
	May INT,
	June INT,
	July INT,
	August INT,
	September INT,
	October INT,
	November INT,
	December INT	
);
SELECT * FROM information_schema.tables WHERE table_name = 'endangered_population';

SELECT column_name
FROM information_schema.columns
WHERE table_name = 'endangered_population';

ALTER TABLE endangered_population
RENAME COLUMN "endangered_status" TO endangered_status;

-- Step 1: Add the new column 'sequence'
ALTER TABLE Endangered_population
ADD COLUMN sebase SERIAL;

-- Step 2: Drop the current primary key (assuming it's named 'Endangered_population_pkey')
ALTER TABLE Endangered_population
DROP CONSTRAINT Endangered_population_pkey;

-- Step 3: Set the new 'sequence' column as the primary key
ALTER TABLE Endangered_population
ADD PRIMARY KEY (sebase);

ALTER TABLE Endangered_population
DROP COLUMN sebase;


Select * FROM livestock_population;