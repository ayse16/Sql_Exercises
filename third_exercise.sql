/*
Questions:

Single-Row Subqueries:

Write a query to find the maximum duration among the tracks. Your query should include TrackId, Name, Milliseconds.

Write a query to find the minimum duration among the tracks. Your query should include TrackId, Name, Milliseconds.

Write a query to find the tracks whose bytes are higher than the average of the bytes of all tracks. Your query should include TrackId, Name, Bytes, general average and should be ordered by Bytes from highest to lowest. General average is the average of all tracks. General average should repeat in every row. (Hint: You need to use two subqueries)

   Multiple-Row Subqueries:

Write a query that returns the customers whose sales representatives are Jane Peacock and Margaret Park. Your query should include CustomerID, First Name and Last Name of the customers.

Rewrite the subquery above using the JOIN.

   DDL (CREATE, ALTER, DELETE) and DML (SELECT, INSERT, UPDATE, DELETE) Statements

Create a table inside the chinook database. This table tracks the employees’ courses inside the organization. Your table should have the followings features:

               Name of the table: courses
               Columns:
                    CourseId (Primary Key)
                    CourseName (Cannot be null)
                    EmployeeId (Foreign Key - Refers to EmployeeId of employees table ) 
                    CoursePrice

      2. Insert at least 5 rows into the courses table. Your EmployeeId should contain the values of the EmployeeId column on the employees table. You’re free to choose any values for other columns (CourseId, CourseName, CoursePrice)
3. Delete the last row of your courses table.

4. Add a new column to your courses table named StartDate. The new column cannot be null.

5. Delete the CoursePrice column.

6. Delete the courses table.
/*
/*Question_1*/
select TrackId, Name, Milliseconds
from tracks
where Milliseconds = (select max(milliseconds)
                      from tracks);

/*Question_2*/
select TrackId, Name, Milliseconds
from tracks
where Milliseconds = (select min(milliseconds)
                      from tracks); 

/*Question_3*/
select TrackId, Name, Bytes, (select round(avg(bytes)) 
               from tracks) as "General average"
from tracks
where Bytes > (select round(avg(bytes))
               from tracks)
group by TrackId
order by Bytes desc;               

/*Multiple_Row Subqueries*/
/*Question_1*/
select CustomerId, FirstName, LastName
from customers
where SupportRepId in(select EmployeeId
                      from employees
                      where EmployeeId in(3,4));

/*Question_2*/
select customers.CustomerId, customers.FirstName, customers.LastName
from customers
inner join employees
on customers.SupportRepId = employees.EmployeeId
where employees.EmployeeId in(3,4);
                                  
/*********************DDL******************/
/*Question_1*/
create table courses(
                     CourseId int PRIMARY KEY,
                     CourseName text NOT NULL,
                     CoursePrice int,
                     EmployeeId int,
                     FOREIGN KEY(EmployeeId)
                     REFERENCES employees(EmployeeId)
                     
                    ); 
.table 
/*Question_2*/
insert into courses(CourseId, CourseName, EmployeeId, CoursePrice)
values(100, 'Python', 1, 1000),
      (101, 'Sql', 2, 500),
      (102, 'AWS', 3, 1500),
      (103, 'Jira', 4, 300),
      (104, 'Network', 5, 350);
select * from courses; 
/*Question_3*/
delete from courses 
where CourseId = (Select Max(CourseId)
                  From courses);

select * from courses;
/*Question_4*/
Alter table courses
add column StartDate text default '01/01/2021';                  
select * from courses;

/*Question_5*/
Alter Table courses Rename To old_courses;
.table
create table courses(
                     CourseId int,
                     CourseName text NOT NULL,
                     EmployeeId int,
                     StartDate text NOT NULL default '01/01/2021',
                     FOREIGN KEY(EmployeeId)
                     REFERENCES employees(EmployeeId)); 

insert into courses
Select CourseId, CourseName, EmployeeId, StartDate  
From old_courses;
select * from courses; 
/*Question_6*/
.table
drop table courses;                   
.table

