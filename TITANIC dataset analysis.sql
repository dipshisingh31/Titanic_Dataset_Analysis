/*
-- THIS CODE TAKES TATANIC PASSESNGER DATA AND VIA QUERIES GIVES THE SURVIVAL RATE OF PASSENGENRS
-- PASSENGERS DEMOGRAPHICS AND RESIDING IN THE SHIP FACTS ARE USED

*/


-----------------------
-- SNAPSHOT OF DATA 
-----------------------

-- CONNECT TO SERVER -- LAPTOP87374

USE DB3878; -- CONNECT TO DB

SELECT top 50 * FROM TITANIC


----------------------
--1.	Survival Rates by Class, Gender, and Age
-----------------------

SELECT
  Pclass,
  Sex,
  AVG(CAST(Survived AS FLOAT)) AS survival_rate
FROM titanic
GROUP BY Pclass, Sex
ORDER BY Pclass, Sex;


----------------------
--2.	Survival Rates by Family Size
-----------------------

SELECT
  CASE
    WHEN SibSp + Parch = 0 THEN 'Alone'
    WHEN SibSp + Parch > 0 THEN 'With Family'
  END AS family_size,
  AVG(CAST(Survived AS FLOAT)) AS survival_rate
FROM titanic
GROUP BY family_size
ORDER BY survival_rate DESC;


----------------------
--3.	Survival Rates by Embarkation Port
-----------------------

SELECT
  Embarked,
  AVG(CAST(Survived AS FLOAT)) AS survival_rate
FROM titanic
GROUP BY Embarked
ORDER BY survival_rate DESC;


----------------------
--4.	Feature Importance Analysis
-----------------------

SELECT
  ROUND(CORR(CAST(Survived AS FLOAT), Pclass), 2) AS pclass_corr,
  ROUND(CORR(CAST(Survived AS FLOAT), CAST(Sex AS FLOAT)), 2) AS sex_corr,
  ROUND(CORR(CAST(Survived AS FLOAT), Age), 2) AS age_corr,
  ROUND(CORR(CAST(Survived AS FLOAT), SibSp), 2) AS sibsp_corr,
  ROUND(CORR(CAST(Survived AS FLOAT), Parch), 2) AS parch_corr,
  ROUND(CORR(CAST(Survived AS FLOAT), Fare), 2) AS fare_corr
FROM titanic;


----------------------
--END OF QUERY
-----------------------




