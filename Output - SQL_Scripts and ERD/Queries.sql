-- 1) For each employee: employee number, last name, first name, gender, and salary
select t1.emp_no, 
	   t1.last_name,
	   t1.first_name,
	   t1.gender,
	   t2.salary
	   from employees t1
	   inner join salaries t2 
	   on t1.emp_no = t2.emp_no;
	   
-- 2) List employees who were hired in 1986.
SELECT * from employees 
	where EXTRACT(YEAR from hire_date ) = 1986;

-- 3) List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, 
--and start and end employment dates.
select t5.*, t6.from_date,t6.to_date from dept_emp t6 inner join
		(select t3.dept_no,
	   		t3.depart_name,
	   		t3.emp_no,
	   		t4.last_name,
	   		t4.first_name 
	   		from employees t4
	   		inner join 
					(select t1.dept_no, t2.depart_name, t1.emp_no
						from dept_manager t1 
						inner join department t2 
						on t1.dept_no = t2.dept_no) t3
			on t3.emp_no = t4.emp_no) t5
		on t5.emp_no = t6.emp_no;

-- 4) List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
select t3.emp_no,
	   t3.last_name,
	   t3.first_name,
	   t4.depart_name
from department t4 
	   inner join
	   (Select t1.emp_no,
			   t1.last_name,
			   t1.first_name,
			   t2.dept_no 
				from employees t1 
				inner join dept_emp t2
				on t1.emp_no = t2.emp_no
	   )t3
on t4.dept_no =  t3.dept_no;

-- 5) List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees 
where first_name = 'Hercules' and last_name like 'B%';

-- 6) List all employees in the Sales department, including their 
--employee number,last name, first name, and department name.
select t4.emp_no,
		t4.last_name,
		t4.first_name,
		t3.depart_name 
		from department t3 
		inner join
			(select t2.emp_no,
					t1.last_name, 
					t1.first_name,
					t2.dept_no 
					from employees t1 
					inner join
						(Select emp_no, 
		 						dept_no 
		 						from dept_emp where dept_no =  
		 						(select dept_no from department where depart_name = 'Sales')
						) t2
					on t1.emp_no = t2.emp_no
			) t4
		on t3.dept_no = t4.dept_no;

-- 7) List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select t4.emp_no,
		t4.last_name,
		t4.first_name,
		t3.depart_name 
		from department t3 
		inner join
			(select t2.emp_no,
					t1.last_name, 
					t1.first_name,
					t2.dept_no 
					from employees t1 
					inner join
						(Select emp_no, 
		 						dept_no 
		 						from dept_emp where dept_no in  
		 						(select dept_no from department where depart_name = 'Sales' or depart_name = 'Development' )
						) t2
					on t1.emp_no = t2.emp_no
			) t4
		on t3.dept_no = t4.dept_no;

-- 8) In descending order, list the frequency count of 
--employee last names, i.e., how many employees share each last name.

select last_name , count(last_name) as Freq from employees
group by last_name
order by Freq desc;




