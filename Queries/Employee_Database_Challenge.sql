--PART 1

SELECT e.emp_no,
e.first_name,
e.last_name,
tit.title,
tit.from_date,
tit.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS tit
ON (e.emp_no = tit.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

SELECT * FROM retirement_titles;

-- Use Distinct with Orderby to remove duplicate rows part 2
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles AS rt
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles;

--deliverable 1 part 3, getting count of each title in desc order

SELECT COUNT(ut.emp_no),ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles;

--DELIVERABLE 2
SELECT * FROM dept_emp;

SELECT DISTINCT ON(e.emp_no)e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
tit.title
--DISTINCT ON(emp_no)
--INTO mentor_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS tit
ON (e.emp_no = tit.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;
