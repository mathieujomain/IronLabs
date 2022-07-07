use employees_mod;

select * from t_dept_emp;

select distinct
emp_no, from_date, to_date
from t_dept_emp;

#Create a visualization that provides a breakdown between the male and female employees working in the company each year, 
#starting from 1990
select
YEAR(d.from_date) as calendar_year, e.gender, COUNT(e.emp_no) as number_employees
from t_employees e
join t_dept_emp d 
on d.emp_no = e.emp_no
group by calendar_year, e.gender
having calendar_year >= 1990
order by calendar_year;

#Compare the number of male managers to the number of female managers from different departments for each year, starting from 1990
select * from t_dept_manager;
select * from t_departments;
select * from t_dept_emp;
select * from t_employees;

select d.hire_date, e.from_date
from t_employees d
join t_dept_manager e
on d.emp_no = e.emp_no;

select year(d.from_date) as calendar_year, d.dept_name as department, e.gender as gender, count(d.emp_no) as manager_count
from 
	(select
    t_dept_manager.emp_no, t_dept_manager.from_date, t_departments.dept_name
    from t_dept_manager
    join t_departments
    on t_dept_manager.dept_no = t_departments.dept_no
    ) as d
join t_employees e
on d.emp_no = e.emp_no
group by calendar_year, gender
having calendar_year >= 1990
order by calendar_year asc;

#Compare the average salary of female versus male employees in the entire company until year 2002,
#and add a filter allowing you to see that per each department
select e.gender, d.dept_name, AVG(s.salary) as salary, YEAR(s.from_date) as calendar_year
from t_salaries s
join t_employees e
on s.emp_no = e.emp_no
join t_dept_emp de 
on de.emp_no = e.emp_no
join t_departments d
on d.dept_no = de.dept_no
group by d.dept_no, e.gender, calendar_year
having calendar_year <= 2002
order by calendar_year;

#Create an SQL stored procedure that will allow you to obtain the average male and female salary per department 
#within a certain salary range. Let this range be defined by two values the user can insert when calling the procedure
#Visualize the obtained result-set in Tableau as a double bar chart
drop procedure if exists avg_salary;
DELIMITER $$
create procedure avg_salary (in min_sal float, in max_sal float)
begin
select d.dept_name as department, e.gender as gender, avg(s.salary) as salary
from t_employees e
join t_salaries s
on e.emp_no = s.emp_no
join t_dept_emp de
on de.emp_no = e.emp_no
join t_departments d
on d.dept_no = de.dept_no
where s.salary >= min_sal and s.salary <= max_sal
group by department, gender;
END $$
DELIMITER ;

select min(salary) from t_salaries;
select max(salary) from t_salaries;

CALL avg_salary(31350, 160377);