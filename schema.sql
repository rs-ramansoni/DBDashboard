CREATE TABLE COST (

  COST_ID serial PRIMARY KEY,

  COST_TYPE VARCHAR NOT NULL);

INSERT INTO COST VALUES (1,'HIGH'),(2,'MEDIUM'),(3,'LOW');

CREATE TABLE LOCATION (

  LOCATION_ID serial PRIMARY KEY,

  REGION VARCHAR NOT NULL);

INSERT INTO LOCATION VALUES (1,'AMER'),(2,'APAC'),(3,'DEU'),(4,'EMEA'),(5,'UK');

CREATE TABLE POSITION (

  POSITION_ID serial PRIMARY KEY,

  DESIGNATION VARCHAR NOT NULL,

  DESCRIPTION VARCHAR NULL DEFAULT NULL);

INSERT INTO POSITION VALUES (1,'Analyst',NULL),(2,'Assistant Vice President',NULL),(3,'Associate',NULL),(4,'Director',NULL),(5,'Managing Director',NULL),(6,'No Corporate Title',NULL),(7,'Not Applicable',NULL),(8,'Vice President',NULL);

CREATE TABLE EMPLOYEE_TYPE (

  EMPLOYEE_TYPE_ID serial PRIMARY KEY,

  EMPLOYEE_TYPE VARCHAR NOT NULL);

 INSERT INTO EMPLOYEE_TYPE VALUES (1,'administrative'),(2,'permanent'),(3,'services');

CREATE TABLE DEPARTMENT (

  DEPARTMENT_ID serial PRIMARY KEY,

  PARENT_ID INT NOT NULL REFERENCES DEPARTMENT (DEPARTMENT_ID),

  DEPARTMENT_KEY VARCHAR NOT NULL,

  NAME VARCHAR NOT NULL,

  DESCRIPTION VARCHAR NULL DEFAULT NULL );

INSERT INTO DEPARTMENT(PARENT_ID,DEPARTMENT_KEY, NAME, DESCRIPTION) VALUES (1,'G_6018','Group CIO',NULL),(1,'G_1200','Group CTO',NULL),(1,'G_6413','CIO for Chief Administrative Office',NULL),(1,'G_6901','Safety and Soundness',NULL),(1,'G_6455','CIO for Regulation, Compliance and Anti-Financial',NULL),(1,'G_7110','CIO Collaborative Technology Solutions',NULL),(1,'G_7109','Group IT Strategy & Transformation',NULL);

INSERT INTO DEPARTMENT(PARENT_ID,DEPARTMENT_KEY, NAME, DESCRIPTION) VALUES (2,'G_0705','CIO End User Services',NULL),(2,'G_0735','CIO Engineering Services',NULL),(2,'G_4136','CIO Infrastructure Services',NULL),(2,'G_4137','Strategy & Transformation',NULL),(2,'G_4387','Group Information Records Management (GIRM)',NULL),(2,'G_6509','CIO - Mgmt, Grads & Regional PMO',NULL),(2,'G_6510','Group Architecture',NULL),(2,'G_6546','Business Infrastructure Integration',NULL),(2,'G_6547','CIO Data',NULL),(2,'G_6548','CIO Treasury',NULL),(2,'G_6645','CIO Finance',NULL),(2,'G_6887','Risk, Finance & Treasury in the Americas',NULL),(2,'G_7097','CIO Risk',NULL),(3,'G_5989','CAO - HR CTB',NULL),(3,'G_6818','CAO - Legal CTB',NULL),(5,'G_6506','RCA Tech - Strategy CTB',NULL),(5,'G_6507','RCA Tech - AFC CTB',NULL),(5,'G_6834','RCA Tech - Compliance CTB',NULL),(4,'G_0737','CTO APAC',NULL),(4,'G_1900','Command Center',NULL),(4,'G_2073','Infrastructure Operations',NULL),(4,'G_4142','Enterprise Testing Services',NULL),(4,'G_4413','PWCC, Finance & HR Production',NULL),(4,'G_4416','Risk and Control',NULL),(4,'G_4468','Shared Services Production',NULL),(4,'G_7256','Global Branch Support Production',NULL),(4,'G_7272','Corporate & Investment Bank S&S',NULL),(4,'G_7281','Operational Readiness',NULL),(4,'G_7290','End User Operation',NULL),(4,'G_7296','Run Architecture',NULL),(7,'G_8103','Group IT Strategy & Transformation RTB',NULL),(6,'G_4437', 'Collaborative Technology Solutions RTB', NULL);

CREATE TABLE TENURE (

  TENURE_ID serial PRIMARY KEY,

  CATEGORY VARCHAR NOT NULL);

INSERT INTO TENURE VALUES (1,'LESS THAN 3 YEARS'),(2,'3 TO 5 YEARS'),(3,'5 TO 8 YEARS'),(4,'MORE THAN 8 YEARS');
 
CREATE TABLE TENURE_MAPPING (

  ID INT NOT NULL REFERENCES TENURE (TENURE_ID),

  YEAR INT NULL);

INSERT INTO TENURE_MAPPING VALUES (1,0),(1,1),(1,2),(2,3),(2,4),(3,5),(3,6),(3,7),(4,8);

CREATE TABLE EMPLOYEE (

  EMPLOYEE_ID serial PRIMARY KEY ,

  EMPLOYEE_DB_ID INT NOT NULL,

  DEPT_ID INT NOT NULL REFERENCES DEPARTMENT (DEPARTMENT_ID),

  COST_ID INT NOT NULL REFERENCES COST (COST_ID),

  EMPLOYEE_TYPE_ID INT NOT NULL REFERENCES EMPLOYEE_TYPE (EMPLOYEE_TYPE_ID),

  POSITION_ID INT NOT NULL REFERENCES POSITION (POSITION_ID),

  TENURE_ID INT NOT NULL REFERENCES TENURE (TENURE_ID),

  LOCATION_ID INT NOT NULL REFERENCES LOCATION (LOCATION_ID),

  JOINING_DATE DATE NOT NULL,

  JOB_END_DATE DATE NULL DEFAULT NULL,

  DURATION INT NOT NULL); 

INSERT INTO EMPLOYEE (EMPLOYEE_DB_ID,DEPT_ID, COST_ID, EMPLOYEE_TYPE_ID,  TENURE_ID, LOCATION_ID, JOINING_DATE, JOB_END_DATE,POSITION_ID,DURATION)

VALUES  (8409111,7,3,1,2,2,'2014-02-22',NULL,2,4),

                                (8409112,8,3,3,2,2,'2015-03-22',NULL,1,3),

                                (8409113,11,3,3,1,2,'2016-04-22',NULL,1,2),

                                (8408914,20,2,2,1,2,'2017-05-22',NULL,3,1),

                                (8409123,7,2,1,3,2,'2011-06-22',NULL,6,7),

                                (8409124,8,3,3,3,2,'2012-07-22',NULL,1,6),

                                (8409125,11,1,3,3,2,'2013-08-22',NULL,1,5),

                                (8408926,20,1,1,2,2,'2014-09-22',NULL,3,4),

                                (8408527,21,2,2,2,2,'2015-02-22',NULL,8,3),

                                (8409128,10,2,1,4,1,'2016-06-22',NULL,6,2),

                                (8409129,14,3,3,3,1,'2017-07-22',NULL,1,1),

                                (8409130,17,1,3,3,3,'2011-08-22',NULL,1,7),

                                (8408929,30,1,1,3,3,'2012-09-22',NULL,3,6),

                                (8408523,31,2,2,2,3,'2013-02-22',NULL,8,5),

                                (8409165,7,2,1,4,2,'2010-06-22',NULL,6,8),

                                (8409166,8,3,3,3,2,'2011-07-22',NULL,1,7),

                                (8409167,11,1,3,3,3,'2012-08-22',NULL,1,6),

                                (8408968,20,1,1,3,1,'2013-09-22',NULL,3,5),

                                (8408569,21,2,2,2,1,'2014-02-22',NULL,8,4),

                                (8408939,3,2,1,4,1,'2009-06-22',NULL,4,9),

                                (8409132,4,3,3,1,2,'2016-08-22',NULL,3,2),

                                (8409133,33,3,3,3,3,'2011-11-22',NULL,1,7),

                                (8408934,29,1,1,3,4,'2012-08-22',NULL,5,6),

                                (8408535,26,1,2,1,1,'2016-01-22',NULL,8,2),

                                (8409142,2,1,1,4,1,'2001-07-22',NULL,1,16),

                                (8409140,3,1,1,1,1,'2015-08-22',NULL,1,2),

                                (8409158,32,1,1,3,1,'2011-07-22',NULL,3,7),

                                (8408956,28,2,1,3,1,'2010-08-22',NULL,3,7),

                                (8408501,25,2,2,1,1,'2017-07-22',NULL,2,1);