SELECT * FROM Ali1.Q1;
CREATE DATABASE movies5;
SELECT * FROM Ali1.Q1;
SHOW DATABASES;
CREATE TABLE student7(Name VARCHAR(30) NOT NULL,
	Major CHAR(2) NOT NULL DEFAULT "QF",
    birth_date DATE NULL,
    Chemistry FLOAT NULL,
    HISTORY FLOAT NULL,
    student_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY);
INSERT INTO student7 VALUES(
    'Ali',
    'FE',
    "1990-2-2",
    17.5,
    19,
    NULL);
SELECT * FROM Ali1.student7;


SELECT * FROM out2;
SHOW VARIABLES LIKE "local_infile";
SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 'ON';
CREATE DATABASE IF NOT EXISTS movies4;
CREATE DATABASE movies4;
CREATE  TABLE IF NOT EXISTS Ali1.`Members` (
  `membership_number` INT  AUTO_INCREMENT ,
  `full_names` VARCHAR(150) NOT NULL ,
  `gender` VARCHAR(6) ,
  `date_of_birth` DATE ,
  `physical_address` VARCHAR(255) ,
  `postal_address` VARCHAR(255) ,
  `contact_number` VARCHAR(75) ,
  `email` VARCHAR(255) ,
  PRIMARY KEY (`membership_number`) )
ENGINE = InnoDB;

CREATE TABLE`all_data_types` (
    `varchar` VARCHAR( 20 )  ,
    `tinyint` TINYINT  ,
    `text` TEXT  ,
    `date` DATE  ,
    `smallint` SMALLINT  ,
    `mediumint` MEDIUMINT  ,
    `int` INT  ,
    `bigint` BIGINT  ,
    `float` FLOAT( 10, 2 )  ,
    `double` DOUBLE  ,
    `decimal` DECIMAL( 10, 2 )  ,
    `datetime` DATETIME  ,
    `timestamp` TIMESTAMP  ,
    `time` TIME  ,
    `year` YEAR  ,
    `char` CHAR( 10 )  ,
    `tinyblob` TINYBLOB  ,
    `tinytext` TINYTEXT  ,
    `blob` BLOB  ,
    `mediumblob` MEDIUMBLOB  ,
    `mediumtext` MEDIUMTEXT  ,
    `longblob` LONGBLOB  ,
    `longtext` LONGTEXT  ,
    `enum` ENUM( '1', '2', '3' )  ,
    `set` SET( '1', '2', '3' )  ,
    `bool` BOOL  ,
    `binary` BINARY( 20 )  ,
    `varbinary` VARBINARY( 20 )
) ENGINE= MYISAM ;

SELECT * FROM Ali1.Q1 WHERE idnew_table = 10017;
SELECT * FROM Ali1.out2 WHERE firmid = 11659;
SHOW TABLES;
SELECT (15 + 6) AS ADDITION;
SELECT COUNT(*) AS "RECORDS" FROM out2;
SELECT CURRENT_TIMESTAMP;
SELECT CURDATE();
DROP DATABASE movies2;
USE Ali2;
CREATE TABLE CUSTOMERS(
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT              NOT NULL,
   ADDRESS  CHAR (25) ,
   SALARY   DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);
SELECT * FROM CUSTOMERS;
DESC CUSTOMERS;
DROP TABLE all_data_types;
INSERT INTO CUSTOMERS2 (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000.00 );
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (3, 'kaushik', 23, 'Kota', 2000.00 );

CREATE TABLE CUSTOMERS2(
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT              NOT NULL,
   ADDRESS  CHAR (25) ,
   SALARY   DECIMAL (18, 2)     
);

INSERT INTO CUSTOMERS 
VALUES (7, 'Muffy', 24, 'Indore', 10000.00 );
SELECT ID, NAME, SALARY FROM CUSTOMERS;
SELECT ID, NAME, SALARY 
FROM CUSTOMERS
WHERE SALARY = 2000;
SELECT ID, NAME, SALARY 
FROM CUSTOMERS
WHERE SALARY = 2000 AND age < 25;
UPDATE CUSTOMERS
SET ADDRESS = 'Pune'
WHERE ID = 7;
SELECT * FROM out2;
UPDATE CUSTOMERS
SET ADDRESS = 'NY';
DELETE FROM CUSTOMERS
WHERE ID = 3;
SELECT * FROM CUSTOMERS
WHERE SALARY LIKE '200%';
desc out2;
SELECT * FROM Q1
LIMIT 3;
use Ali1;
SELECT * FROM out2
   ORDER BY firmid DESC;
SELECT firmid, SUM(similscore) FROM out2
   GROUP BY firmid;
SELECT SUM(similscore) FROM out2
   GROUP BY firmid;
SELECT DISTINCT firmid FROM out2;
SELECT * FROM out2
   ORDER BY firmid,mgrno;
SELECT * FROM out2;
SELECT * FROM a;
SELECT firmid, LenderID, mgrname, gvkey_B
   FROM out2, a
   WHERE  out2.firmid = a.LenderID;
desc a;


SELECT  firmid, LenderID, mgrname, gvkey_B
   FROM out2
   LEFT JOIN a
   ON out2.firmid = a.LenderID
UNION
   SELECT  firmid, LenderID, mgrname, gvkey_B
   FROM out2
   RIGHT JOIN a
   ON out2.firmid = a.LenderID;
   
SELECT  *
   FROM out2
   WHERE firmid IS NULL;
   #Alias
SELECT  ID AS CUSTOMER_ID, NAME AS CUSTOMER_NAME
   FROM Ali2.CUSTOMERS
   WHERE SALARY IS NOT NULL;
CREATE INDEX index_name
ON out2 (firmid);

#Alter
ALTER TABLE a ADD SEX char(1);
SELECT * FROM a;
ALTER TABLE a DROP SEX;
SELECT * FROM Ali2.CUSTOMERS2;

# Deleting a table
TRUNCATE TABLE Ali2.CUSTOMERS2;
SELECT * FROM new_out2;
SELECT COUNT(firmid)
FROM new_out2;
#Copy a table
CREATE TABLE new_out3 AS
SELECT * FROM out2;

#View
CREATE VIEW out2_VIEW AS
SELECT firmid, firmalpha
FROM  out2;
SELECT * FROM out2_VIEW;
SELECT COUNT(firmid)
FROM  out2_VIEW;
UPDATE out2_VIEW
   SET firmalpha = 'TAATIAN'
   WHERE firmid = 24886;
DELETE FROM out2_VIEW
   WHERE firmid = 11659;
SELECT *
FROM a_VIEW
GROUP BY LenderID
HAVING COUNT(CountryOfSyndication) >= 10;
SELECT * FROM Ali2.CUSTOMERS;

CREATE VIEW a_VIEW AS
SELECT LenderID, DistributionMethod, CountryOfSyndication
FROM  a;

SELECT *
FROM Ali2.CUSTOMERS
GROUP BY age
HAVING COUNT(age) >= 2;

SELECT ADDDATE('1998-01-02', 31);
# Subqueries
SELECT * 
   FROM a 
   WHERE UltimateParentID_L IN (SELECT LenderID 
         FROM a 
         WHERE FacilityAmt > 1000000) ;
SELECT * FROM a;

CREATE TABLE INSECT(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
    name VARCHAR(30) NOT NULL, # type of insect
    date DATE NOT NULL, # date collected
    origin VARCHAR(30) NOT NULL # where collected
);
INSERT INTO INSECT (id,name,date,origin) VALUES
    (NULL,'housefly','2001-09-10','kitchen'),
    (NULL,'millipede','2001-09-10','driveway'),
    (NULL,'grasshopper','2001-09-10','front yard');
SELECT * FROM INSECT;

CREATE TABLE INSECT2(
    id INT UNSIGNED NOT NULL ,
    name VARCHAR(30) NOT NULL, # type of insect
    date DATE NOT NULL, # date collected
    origin VARCHAR(30) NOT NULL # where collected
);


