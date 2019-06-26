-- ROLLUPS and CUBES

CREATE TABLE sales
(
	continent varchar(20),
	country varchar(20),
	city varchar(20),
	units_sold integer
);

INSERT INTO sales VALUES ('North America', 'Canada', 'Toronto', 10000);
INSERT INTO sales VALUES ('North America', 'Canada', 'Montreal', 5000);
INSERT INTO sales VALUES ('North America', 'Canada', 'Vancouver', 15000);
INSERT INTO sales VALUES ('Asia', 'China', 'Hong Kong', 7000);
INSERT INTO sales VALUES ('Asia', 'China', 'Shanghai', 3000);
INSERT INTO sales VALUES ('Asia', 'Japan', 'Tokyo', 5000);
INSERT INTO sales VALUES ('Europe', 'UK', 'London', 6000);
INSERT INTO sales VALUES ('Europe', 'UK', 'Manchester', 12000);
INSERT INTO sales VALUES ('Europe', 'France', 'Paris', 5000);

SELECT *
FROM sales
ORDER BY continent
	,country
	,city
	
SELECT continent
	,sum(units_sold)
FROM sales
GROUP BY continent

SELECT country
	,sum(units_sold)
FROM sales
GROUP BY country

SELECT city
	,sum(units_sold)
FROM sales
GROUP BY city

SELECT continent
	,country
	,city
	,SUM(units_sold)
FROM sales
GROUP BY GROUPING SETS(continent,country,city,())

-- ROLLUP: Three, two, and single column roll up
SELECT continent
	,country
	,city
	,SUM(units_sold)
FROM sales
GROUP BY ROLLUP(continent,country,city)

-- CUBE: GROUPING BY individually and combination of two columns. 
SELECT continent
	,country
	,city
	,SUM(units_sold)
FROM sales
GROUP BY CUBE(continent,country,city)

