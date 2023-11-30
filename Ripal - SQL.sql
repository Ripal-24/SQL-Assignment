SELECT * FROM hr.employees;

#2. Display only the hire date and employee name for each employee. 

select hire_date, first_name, last_name from employees

#3. Display the ename concatenated with the job ID, separated by a comma and space, and
name the column Employee and Title 

select concat(first_name, " ", job_id)
As empoyee_title from employees 

#4. Display the hire date, name and department number for all clerks. 

select hire_date, first_name, last_name
from employees
where job_id like "%clerk"

#5. Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT 

select concat(employee_id, ", ", first_name, ", ", last_name, ", ", email, ", ", phone_number, ", ", hire_date, ", ", job_id, ", ", salary, ", ", manager_id, ", ", department_id) 
As empoyee_title from employees

select concat(employee_id, ", ", first_name, ", ", last_name, ", ", email, ", ", phone_number, ", ", hire_date, ", ", job_id, ", ", salary, ", ", manager_id, ", ", department_id, ", ", commission_pct) 
As empoyee_title from employees


select hire_date, first_name, department_id
from employees
where job_id like "%clerk"

#6. Display the names and salaries of all employees with a salary greater than 2000. 

select first_name, salary, 
case
when salary > 2000
from employees

select employee_id, salary, 
case 
when salary between 0 and 10000 then "group A" 
when salary between 10000 and 20000 then "group B"
when salary > 20000 then "group C"
end 
"salary_group"
from employees
order by salary_group

#7.Display the names and dates of employees with the column headers "Name" and "Start
Date

select first_name as Name, hire_date as start_date from employees

#8. Display the names and hire dates of all employees in the order they were hired. 

select first_name, last_name, hire_date from employees order by hire_date

#9. Display the names and salaries of all employees in reverse salary order. 

select first_name, last_name, salary from employees order by salary desc

#10. Display 'ename" and "deptno" who are all earned commission and display salary in
reverse order. 

select first_name, Last_name, department_id from employees where commission_pct is not null order by salary desc

#11. Display the last name and job title of all employees who do not have a manager 

select last_name, job_id from employees where manager_id is null 

#12. Display the last name, job, and salary for all employees whose job is sales representative
or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000

select last_name, job_id, salary from employees where job_id like 'ST_CLERK' or job_id like'SA_REP' and 
salary not in (2500,3500, 5000)

select last_name, job_id, salary from employees where job_id in ('ST_CLERK', 'SA_REP') and 
salary not in (2500,3500, 5000)


#30

#1) Display the maximum, minimum and average salary and commission earned. 



select first_name, salary from employees where salary = (select max(salary) from employees);

select first_name, salary from employees where salary = (select min(salary) from employees);

select first_name, salary from employees where salary = (select avg(salary) from employees);

select first_name, salary from employees where commission_pct = (select max(commission_pct) from employees);

select first_name, salary from employees where commission_pct = (select min(commission_pct) from employees);

select first_name, salary from employees where commission_pct = (select avg(commission_pct) from employees);

#2 Display the department number, total salary payout and total commission payout for each department. 

SELECT department_id, SUM(salary)
FROM employees 
GROUP BY department_id;

SELECT department_id, SUM(salary), sum(commission_pct)
FROM employees 
GROUP BY department_id;

#3) Display the department number and number of employees in each department. 

  select department_id, count(*)from employees group by department_id
  
#4) Display the department number and total salary of employees in each department. 

 select department_id, sum(salary), count(*)from employees group by department_id
      
#5) Display the employee's name who doesn't earn a commission. Order the result set
without using the column name

select first_name, last_name from employees where commission_pct is null

#6) Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'. Name the columns appropriately

select first_name, department_id, commission_pct,
case 
when commission_pct is null then "No commission" 
end 
"Commission_In_Perc"
from employees

#7) Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns 
appropriately

select first_name, salary *2, commission_pct*2 ,
case 
when commission_pct is null then "No commission" 
end 
"Commission_In_Perc"
from employees

#7  Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns
appropriately

SELECT e1.first_name, e1.department_id
FROM employees e1
INNER JOIN employees e2 ON (e1.first_name = e2.first_name AND e1.department_id = e2.department_id)
WHERE e1.employee_id != e2.employee_id;

#8) Display the employee's name, department id who have the first name same as another employee in the same department

SELECT e1.first_name, e1.department_id
FROM employees e1
INNER JOIN employees e2 ON (e1.first_name = e2.first_name AND e1.department_id = e2.department_id)
WHERE e1.first_name = e2.first_name;

#9) Display the sum of salaries of the employees working under each Manager. 

select manager_id, sum(salary) from employees group by manager_id 

#10) Select the Managers name, the count of employees working under and the department ID of the manager

 SELECT manager_id, COUNT(*) 
	FROM employees 
		GROUP BY manager_id, department_id;

#11 Select the employee name, department id, and the salary. Group the result with the 
#manager name and the employee last name should have second letter 'a! 

select first_name, department_id, salary from employees where last_name like '_a%' 
group by manager_id 

#
#12) Display the average of sum of the salaries and group the result with the department id.
#Order the result with the department id. 

select avg(salary) , department_id from employees GROUP By department_id order by department_id

#13) Select the maximum salary of each department along with the department id

select MAX(salary) , department_id from employees group by department_id

#14) Display the commission, if not null display 10% of salary, if null display a default value 1

select commission_pct ,
CASE 
 when commission_pct is null then "1"
 when commission_pct is not null then salary/10
 end
"Commission Pct"
from employees



#31

#1. Write a query that displays the employee's last names only from the string's 2-5th position with the first letter capitalized and all other letters lowercase, Give each column an
appropriate label. 

select concat(upper(substring(last_name, 2, 1)), substring(last_name,3,3)) as 'New name'  from employees 

#2. Write a query that displays the employee's first name and last name along with a " in
between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the
month on which the employee has joined.

select concat(first_name, " - ", last_name) as "employee", monthname(start_date) 
as "Join month" from employees join job_history using (employee_id);

#3. Write a query to display the employee's last name and if half of the salary is greater than
ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of
1500 each. Provide each column an appropriate label. 

select last_name, salary,
case
when  salary / 2 > 10000 then salary + (salary * 0.10) + 1500
else salary + (salary * 0.115) + 1500
end
as "New Salary"
from employees;

#4 Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end,
#department id, salary and the manager name all in Upper case, if the Manager name
#consists of 'z' replace it with '$! 

select concat(substring(e.employee_id,1,2), "00" ,substring(e.employee_id,3), "E") 
as "Updated ID", e.department_id, e.salary, REPLACE(upper(m.last_name), "Z", "$") as "New Name"
from employees as e join employees as m on e.manager_id = m.employee_id;

#5. Write a query that displays the employee's last names with the first letter capitalized and 
all other letters lowercase, and the length of the names, for all employees whose name
starts with J, A, or M. Give each column an appropriate label. Sort the results by the
#employees' last names.

select concat(upper(left(last_name, 1)), substring(last_name, 2)) as "New Last Name", length(last_name) as "Name Length" from employees
where last_name like 'J%' or last_name like 'A%' or last_name like 'M%' order by last_name;

-- 6. Create a query to display the last name and salary for all employees. Format the salary to
-- be 15 characters long, left-padded with $. Label the column SALARY

select last_name, lpad(concat('$', salary), 15, '$') as salary from employees;

-- 7. Display the employee's name if it is a palindrome

select last_name,
case 
when last_name = reverse(last_name) then "Palindrome"
else "Not Pelindrome"
end
from employees;

-- 8. Display First names of all employees with initcaps.

select concat(upper(substring(First_name,1,1)), lower(substring(First_name,2))) AS "Name" from employees;

-- 9. From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column.

select substring_index(substring_index (street_address," ", 2)," ",-1) as "street"  from locations;

-- 10. Extract first letter from First Name column and append it with the Last Name. Also add
-- "@systechusa.com" at the end. Name the column as e-mail address. All characters should
-- be in lower case. Display this along with their First Name.

select concat(lower(substring(First_name,1,1)), lower(Last_name), "@systechusa.com") as "Emaail Address", First_name from employees;

-- 11. Display the names and job titles of all employees with the same job as Trenna.

select first_name, job_title from employees join jobs using (job_id) where first_name like "%Trenna";

-- 12. Display the names and department name of all employees working in the same city as Trenna.

select first_name, city from employees join departments using (department_id) join locations using (location_id)
where city= (select  distinct city from employees join departments using (department_id) join locations using (location_id)
where first_name like "%Trenna");

-- 13. Display the name of the employee whose salary is the lowest.

select first_name, salary from employees where salary = (select min(salary) from employees);

-- 14. Display the names of all employees except the lowest paid.

select first_name, salary from employees where salary <> (select min(salary) from employees);



32


-- 1. Write a query to display the last name, department number, department name for all employees.

select last_name, department_id, department_name from employees join departments using (department_id);

-- 2. Create a unique list of all jobs that are in department 4. Include the location of the department in the output.

select distinct(job_id), department_id, location_id
from departments join locations using (location_id) join jobs 
where department_id= 40;

-- 3.  Write a query to display the employee last name,department name,location id and city of all employees who earn commission.

select last_name, department_name, location_id, city, commission_pct
from employees join departments using (department_id) join locations using (location_id)
where commission_pct is not null;

-- 4. Display the employee last name and department name of all employees who have an 'a' in their last name

select last_name, department_name
from employees join departments using (department_id)
where last_name like "%a%";

-- 5. Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA.

select last_name, job_id, department_name, country_name
from employees join departments using (department_id) join locations using (location_id) join countries
where country_name like "%atlanta";

-- 6. Display the employee last name and employee number along with their manager's last name and manager number.

select e.employee_id, e.last_name, m.employee_id, m.last_name "manager last name"
from employees as e join employees as m on e.manager_id=m.employee_id;

-- 7. Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager).

select e.employee_id, e.last_name , m.employee_id, m.last_name as "manager last name"
from employees as e left join employees as m on e.manager_id=m.employee_id;

-- 8. Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee.

select last_name, department_id, department_name from employees join departments using (department_id) 
where department_name=(select  department_name from employees join departments using (department_id) where last_name like  "hall");

-- 9. Create a query that displays the name,job,department name,salary,grade for all employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C)

select first_name, job_id, department_name, salary,
  case
  when salary >= 5000 then "A"
  when salary >=3000 then "B"
  when salary < 3000 then "C"
  end
  "Grade"
  from employees join departments using (department_id);
  
-- 10. Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date. Label the columns as Employee name, emp_hire_date,manager name,man_hire_date

select E.first_name as "employee_name", E.hire_date , M.first_name as "manger_name", M.hire_date 
from employees as E join employees as M on E.manager_id=M.employee_id
where E.hire_date < M.hire_date;


34


-- 1. Write a query to display the last name and hire date of any employee in the same department as SALES.

select last_name, hire_date, department_name
from employees join departments using (department_id)
where department_name like "SALES";

-- 2. Create a query to display the employee numbers and last names of all employees who
-- earn more than the average salary. Sort the results in ascending order of salary.

select employee_id, last_name, avg(salary)
from employees
where salary > (select avg(salary) from employees)
group by employee_id
order by salary asc;

-- 3. Write a query that displays the employee numbers and last names of all employees who
-- work in a department with any employee whose last name contains a' u 

select  distinct(department_id), last_name, employee_id
from employees join departments using (department_id)
where last_name like "%u%" ;

-- 4. Display the last name, department number, and job ID of all employees whose department location is Atlanta

select last_name, department_id, job_id, department_name, country_id, country_name
from employees join departments using (department_id) join locations using (location_id) join countries using(country_id)
where country_name like "%america";

-- 5. Display the last name and salary of every employee who reports to FILLMORE.

select m.last_name as "manager name",  e.salary, e.last_name as "employee name"
from employees as e join employees as m on e.manager_id=m.employee_id
where m.last_name like "King"

-- 6. Display the department number, last name, and job ID for every employee in the OPERATIONS department.

select department_id, last_name, job_id, department_name
from employees join departments using (department_id)
where department_name like "Operation%";

-- 7. Modify the above query to display the employee numbers, last names, and salaries of all
-- employees who earn more than the average salary and who work in a department with any
-- employee with a 'u'in their name.

select distinct(department_id) employee_id, last_name ,salary
from employees 
where salary < (select avg(salary) from employees) and last_name like "%u%";

-- 8. Display the names of all employees whose job title is the same as anyone in the sales dept.

select concat( first_name," ",last_name) "Name", job_title
from employees join jobs using (job_id)
where job_title like "%sales%";

-- 9. Write a compound query to produce a list of employees showing raise percentages,
-- employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise,
-- employees in department 2 are given a 10% raise, employees in departments 4 and 5 are
-- given a 15% raise, and employees in department 6 are not given a raise.

select employee_id, salary, department_id,
case
when department_id = 10  then salary*"5%"
when department_id = 30 then salary*"5%"
when department_id = 20 then salary*"10%"
when department_id = 40 then salary*"15%"
when department_id = 50 then salary*"15%"
when department_id=60 then salary*1
end
"Raise%"
from employees
where department_id<=70;

-- 10. Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries

select salary, last_name
from employees
order by salary desc
limit 3;

-- 11. Display the names of all employees with their salary and commission earned. Employees
-- with a null commission should have O in the commission column 

select  concat(first_name," ",last_name)"Name", salary, 
case
when commission_pct is null then "0"
end
" commission"
from employees;

-- 12. Display the Managers (name) with top three salaries along with their salaries and department information

select m.first_name , m.salary, dense_rank()over(order by salary desc)"RN", m.department_id
from employees as e join employees as m on e.manager_id=m.employee_id
group by m.employee_id
limit 3;



35


-- 1. 1) Find the date difference between the hire date and resignation_date for all the
-- employees. Display in no. of days, months and year(1 year 3 months 5 days).
-- Emp_ID Hire Date Resignation_Date
-- 1 1/1/2000 7/10/2013
-- 2 4/12/2003 3/8/2017
-- 3 22/9/2012 21/6/2015
-- 4 13/4/2015 NULL
-- 5 03/06/2016 NULL
-- 6 08/08/2017 NULL
-- 7 13/11/2016 NULL
 
select*, 
case
when resignation_date is not null then concat(floor(datediff(resignation_date,hire_date )/365), "year", 
 floor(datediff(resignation_date,hire_date )%365 /30), "month", floor(datediff(resignation_date,hire_date ) %365%30 ), "days")
 when resignation_date is null  then concat(floor(datediff(now(),hire_date )/365), "year", 
 floor(datediff(now(),hire_date )%365 /30), "month", floor(datediff(now(),hire_date ) %365%30 ), "days")
 end
"Duration"
from empdate;

-- 2. Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd,
-- yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900)

SELECT hire_date, date_format(hire_date,"%m/%d/%y") as "formated hird_date", resignation_date,
case
when resignation_date is not null then date_format(resignation_date,"%M%D%Y")
else"dec,01th1900"
end
"formated resignation date"
from empdate;































