   sub_query_sqlmain_topic
   
   * it is a query or select query inside another query.
   * to improve the maintainbility and performance of your query.
   
7 types of query ;
    
    * single row sub query
    * multi row sub query
    * scalar sub query
    * inline sub query
    * nested sub query 
    * corelated sub query
    * multi column sub query
    
1.single row sub query
     
    * a sub query returning only one row/value.
    * relational operators suported; =,<>,>,<,<=,>=,in,not in

syntex;

 select clm1,clm2,....
 from table_name
 where condition=(select clm1
                  from table_name --------subquery
                  where condition);

1.find silambu after whose high salary

select EMP_ID,E_NAME,salary
from emplys
where E_NAME='Silambu';---find silambu salary

select EMP_ID,E_NAME,salary
from emplys
where salary > 5000;-----silambu next salary

select EMP_ID,E_NAME,salary
from emplys
where salary >(select EMP_ID,E_NAME,salary
from emplys
where E_NAME='Silambu');--its canot run.beacuse where condition we giving 
                            single column but sub_qery 3 columns)
                            
select EMP_ID,E_NAME,salary
from emplys
where salary >(select salary
               from emplys
               where E_NAME='Silambu');--we give the sub query return one value.

2.MULTI ROW SUB QUERY

 * A SUB QUERY RETURNING MORE THAN ONE ROW/value.

  * RELATIONAL OPERATORS SUPPORTED (IN,NOT IN,ALL,ANY)
 
 SELECT CLM1,CLM2,...
 FROM TABLE_NAME
 WHERE CONDITION IN/NOT IN (SELECT CLM1
                            FROM TABLE_NAME
                            WHERE CONDITION);
SELECT * FROM EMPLYS;

select EMP_ID,E_NAME,salary
from emplys
where salary IN (select salary
               from emplys
               where EMP_ID>5);

select EMP_ID,E_NAME,salary
from emplys
where salary >ALL (select salary
               from emplys
               where EMP_ID=3);--SUBQUERY HIGH RECORD VDA ATHA VDA ATHIGAMA ERUKURA
                                 RECORD.WE CANOT USE =,ONLY <,>,<=,>=
 
 SELECT * FROM EMPLYS;              

select EMP_ID,E_NAME,salary
from emplys
where salary >ANY(select salary
               from emplys
               where EMP_ID=3);
               
3.SCALAR SUBQUERY

 * A SUB QUERY INSIDE A SELECT CLAUSE.
 * A SCALAR SUBQUERY RETURNS EXACTLY ONE ROW AS OUTPUT.
 * IF THE SCALAR SUBQUERY FIND NO MATCH,IT RETURNS NULL.
 * IF THE SCALAR SUBQUERY FINDS MORE THAN ONE MATCH.IT RETURNS AN ERROR.
 
 SELECT * FROM INSURANCE_POLICY;
 
 SYNTEX;
       SELECT CLM1,CLM2,(SELECT CLM1
                         FROM TABLE_NAME
                         WHERE CONDITION
       FROM TABLE_NAME
       WHERE CONDITION;
       
 SELECT * FROM CUSTOMER;
 
 SELECT * 
 FROM CUSTOMER
 WHERE CUST_CODE='C00015';
 
 SELECT MAX(OPENING_AMT) FROM CUSTOMER;
 SELECT MIN(OPENING_AMT) FROM CUSTOMER;
 
 SELECT CUST_CODE,CUST_NAME,OPENING_AMT,
        (SELECT MAX(OPENING_AMT) FROM CUSTOMER),
        (SELECT MIN(OPENING_AMT) FROM CUSTOMER)
 FROM  CUSTOMER
 WHERE CUST_CODE='C00015';
 
 SELECT * FROM EMPLYS;
 
 select E_NAME,SALARY,
        (select max(salaRY) FROM EMPLYS),
         (SELECT MIN(SALARY) FROM EMPLYS)
 FROM EMPLYS
 WHERE DEP_ID=1;-------2ND CONDITION
 
 SELECT E_NAME,
        (SELECT DEP_ID FROM EMPLYS WHERE DEP_ID=11)
 FROM EMPLYS
 WHERE DEP_ID=1;---RECORD NO MATCH IT WILL RETURN NULL.--3RD CONDITION.
 
 SELECT * FROM EMPLOYEES;
 
 SELECT LAST_NAME 
 FROM EMPLOYEES
 WHERE MANAGER_ID=9;
 
 SELECT FIRST_NAME,
       (SELECT LAST_NAME FROM EMPLOYEES WHERE MANAGER_ID=9)
 FROM EMPLOYEES
 WHERE EMPLOYEE_ID=1;--4th con--ERROR BECOZ MORE THEN RECORD SUBQUERY.
 
 4.INLINE VIEW / INLINE SUB QUERY
 
 * A SUB QUERY INSIDE A FROM CLAUSE.
 * IN LINE VIEWS ARE USED TO SIMPLIFY COMPLEX QUERIES.
 
SYNTEX;
     
     SELECT CLM1,CLM2,..
     FROM TABLE_NAME,SELECT COLUMN1,...FROM TABLE_NAME)
     WHERE CONDITION;
     
 SELECT * FROM EMPLOYEES;
 
 SELECT ROWNUM,E.*
 FROM EMPLOYEES E;
 
 SELECT ROWNUM,E.*
 FROM EMPLOYEES E
 WHERE ROWNUM=2;
 
* WE USE ROWNUM PROVIDES WHERE CONDITION ONLY ACCEPT =1.IT RETURN VALUE.
  BUT WE CANNOT USE MORE 2,3,4,...ETC.IT WILL NOT RETURN.
* < LESS THEN WE USE ONE OR MORE RECORD.BUT > GREATER THEN WE CANNOT USE.

--HOW TO WE ACHIVE THE QUERY---
 
 SELECT EMPLOYEE_ID,FIRST_NAME,MANAGER_ID
 FROM (SELECT ROWNUM RN,E.* FROM EMPLOYEES E)G
 WHERE RN=2;
 
SELECT * FROM EMPLYS;
 
SELECT *
FROM (SELECT ROWNUM RN,E.*
      FROM EMPLYS E
      ORDER BY ROWNUM DESC)LAST5
WHERE RN>=5;----LAST 5 RECORD.

5.NESTED SUB QUERY
  
    * A SUB QUERY INSIDE A WHERE CLAUSE.

SYNTEX; SELECT CLM1,CLM2,...
        FROM TABLE_NAME
        WHERE CONDITION IN/NOT IN (SELECT CLM1
                                    FROM TABLE_NAME
                                    WHERE CONDITION);
                                    
   *SINGLE ROW SUB QUERY AND MULTI ROW QUERY AS ITS SAME.
   
6.CO-RELATED SUB QUERY

      * IF A SUB QUERY DEPENDS ON OUTER QUERY OR THE OUTER QUERY DEPENDS
        ON INNER QUERY.
  
 SELECT CLM1,CLM2
 FROM TABLE_NAME T1
 WHERE CONDITION IN/NOT IN(SELECT CLM1
                           FROM TABLE_NAME T2
                           WHERE T1.CLM=T2.CLM);
                           
 SELECT * FROM AGENTS;                          
 SELECT * FROM CUSTOMER;
 
 SELECT AGENT_CODE,AGENT_NAME
 FROM AGENTS A
 WHERE A.AGENT_CODE IN (SELECT AGENT_CODE
                        FROM CUSTOMER C
                        WHERE C.AGENT_CODE=A.AGENT_CODE);
                        
     * ONLY MATCHING RECORDS RETURNS.
     
7.MULTI COLUMN SUB QUERY.

     * A SUBQUERY THAT RETURNS MORE THAN ONE COLUMN.
     
SYNTEX;
     SELECT CLM1,CLM2,...
     FROM TABLE_NAME
     WHERE(CLM1,CLM2,...) IN (SELECT CLM1,CLM2,...
                              FROM TABLE_NAME
                              WHERE CONDITION);
                              
SELECT * FROM EMPLYS;

select * 
from EMPLYS
where E_NAME='Mohan'
and dep_id =1;-----------we use 2 condition.

select * 
from emplys
where(E_NAME,DEP_ID) in (select E_NAME,DEP_ID
                          from emplys
                          where EMP_ID in (1,10)); 
-------------------------------------------------------------------------                          

----SUB_query-----

* select (select);
* insert (select);
* update (select);
* delete (select);

* subquery 1st run inner query.after run outer query.

* inner query always select query.not run outer query likes insert,update,delete.
* outer query insert,update,delete. 
--------------------------------------------------------------------------------------------
* 4 types of sub_query

1.single row sub query--always return only one row.
2.multi row sub query
3.multi row multi column subquery
4.co-releated sub query

* inner query elama outer query run agathu.
* outer query elama inner query run agum.

* 1 to 3 types inner query run without outer query.
---------------------------------------------------------------------------------------------
* single row sub_query
     
select max(salary) from employees_salary;

select * from employees_salary where salary=12000;

select *
from employees_salary
where salary =(select max(salary) from employees_salary); 

* single row query we use the relational operator.
  example; =,!=(or)<>,>,>=,<,<=
  this use relational operator single sub query.
  
ques; select the employees_salary who are getting salary more than the avg salary?

select * 
from employees_salary
where salary <(select max(salary) from employees_salary);

select * 
from employees_salary
where salary =(select max(salary) from employees_salary group by project);
----ORA-01427: single-row subquery returns more than one row
---beacuse we used relational operator--------
--SO WE GO FOR MULTIPLE ROW---------

MULTIPLE ROW--------
 WE USE FOR * IN
            * NOT IN
            * > ANY
            * < ANY 
            * > ALL
            * < ALL
            
select * 
from employees_salary
where salary IN (select PROJECT, max(salary) from employees_salary group by project);
-----ORA-00913: too many values 
--MULTI ROW AND MULTI COLUMN SUB QUERY---
select * 
from employees_salary
where (EMP_ID,salary)IN (select EMP_ID,max(salary) from employees_salary group by EMP_ID);

SELECT * FROM EMPLOYEES;

SELECT DISTINCT(MANAGER_ID) FROM EMPLOYEES;

select * 
from employees
where MANAGER_ID NOT IN(SELECT DISTINCT MANAGER_ID FROM EMPLOYEES WHERE MANAGER_ID IS NOT NULL);

* (WHEN YOU TAKE INNER QUERY YOU HAVE TAKE CLM NAME HAVE NOT NULL)

* AS SAME DISTINCT AND GROUP BY.
* GROUP BY FASTER THEN DISTNICT.

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID > ANY (15,40,50) ORDER BY EMPLOYEE_ID;
      -15 AFTER START THE EMPLOYEE_ID 

SELECT * 
FROM EMPLOYEES
WHERE EMPLOYEE_ID < ANY (15,40,50) ORDER BY EMPLOYEE_ID;
      --1-49  INTO RETURN THE EMPLOYEE_ID 

SELECT * 
FROM EMPLOYEES
WHERE EMPLOYEE_ID > ALL (15,40,50) ORDER BY EMPLOYEE_ID;
      --51 ABOVE THE VALUE
 SELECT * 
FROM EMPLOYEES
WHERE EMPLOYEE_ID < ALL (15,40,50) ORDER BY EMPLOYEE_ID;
      ---1 TO 14 INTO VALUE
