SELECT  
    job_id,
    job_title,
    name AS company_name,
    job_via,
    job_schedule_type,
    job_location,
    job_posted_date :: DATE,
    salary_year_avg AS avg_yealry_salary
FROM job_posting_fact
LEFT JOIN
    company_dim ON job_posting_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 100;