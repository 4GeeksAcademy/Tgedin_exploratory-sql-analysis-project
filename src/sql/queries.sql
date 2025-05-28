-- queries.sql
-- Complete each mission by writing your SQL query below the instructions.
-- Don't forget to end each query with a semicolon ;

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;

SELECT
    regions.name,
    regions.country,
    COUNT(DISTINCT observations.species_id) AS species_count
FROM regions 
JOIN observations ON regions.id = observations.region_id
GROUP BY regions.id, regions.name, regions.country
ORDER BY species_count DESC;


SELECT
    strftime('%m', observations.observation_date) AS month,
    COUNT(*) AS total_observations
FROM observations
GROUP BY month
ORDER BY total_observations DESC;


SELECT
    species.scientific_name,
    species.common_name,
    COUNT(observations.id) AS observation_count
FROM species
LEFT JOIN observations ON species.id = observations.species_id
GROUP BY species.id, species.scientific_name, species.common_name
HAVING observation_count < 5
ORDER BY observation_count ASC;

SELECT
    regions.name,
    regions.country,
    COUNT(DISTINCT observations.species_id) AS distinct_species_count
FROM observations
JOIN regions ON observations.region_id = regions.id
GROUP BY regions.id, regions.name, regions.country
ORDER BY distinct_species_count DESC
LIMIT 1;

SELECT
    species.scientific_name,
    species.common_name,
    COUNT(observations.id) AS total_observations
FROM species
JOIN observations ON species.id = observations.species_id
GROUP BY species.id, species.scientific_name, species.common_name
ORDER BY total_observations DESC
LIMIT 10;     


SELECT 
    observations.observer,
    COUNT(*) AS total_observations
FROM observations
GROUP BY observations.observer
ORDER BY total_observations DESC
LIMIT 10;


SELECT 
    species.scientific_name,
    species.common_name
FROM species
LEFT JOIN observations ON species.id = observations.species_id
WHERE observations.id IS NULL
ORDER BY species.scientific_name ASC;

SELECT
    observations.observation_date,
    COUNT(DISTINCT observations.species_id) AS distinct_species_count
FROM observations
GROUP BY observations.observation_date
ORDER BY distinct_species_count DESC
LIMIT 10;


