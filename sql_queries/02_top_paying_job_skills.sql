WITH top_paying_jobs AS(
    SELECT  
        job_id,
        job_title,
        name AS company_name,
        job_via,
        job_posted_date :: DATE,
        salary_year_avg AS avg_yearly_salary
    FROM job_posting_fact
    LEFT JOIN
        company_dim ON job_posting_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills,
    type 
FROM 
    top_paying_jobs
JOIN job_skills_dim ON top_paying_jobs.job_id = job_skills_dim.job_id
JOIN skills_dim ON job_skills_dim.skill_id = skills_dim.skill_id
ORDER BY 
    avg_yearly_salary DESC

/*
    INSIGHTS:
    - SQL is the #1 must-have skill – appears in 8 out of the top 10 roles.
    - Python and R dominate as programming languages for Data Analysts.
    - Data visualization tools like Tableau and Power BI are in high demand — especially Tableau.
    - Cloud & data warehousing skills like Snowflake and AWS are emerging as key differentiators.
    - Libraries like Pandas (Python ecosystem) show demand for strong data manipulation skills.
    - Excel still holds value in top-paying roles — foundational but useful.
*/

/*
OUTPUT:
[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_via": "via ZipRecruiter",
    "job_posted_date": "2023-06-18",
    "avg_yearly_salary": "255829.5",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_via": "via ZipRecruiter",
    "job_posted_date": "2023-06-18",
    "avg_yearly_salary": "255829.5",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_via": "via ZipRecruiter",
    "job_posted_date": "2023-06-18",
    "avg_yearly_salary": "255829.5",
    "skills": "r",
    "type": "programming"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_via": "via ZipRecruiter",
    "job_posted_date": "2023-06-18",
    "avg_yearly_salary": "255829.5",
    "skills": "azure",
    "type": "cloud"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_via": "via ZipRecruiter",
    "job_posted_date": "2023-06-18",
    "avg_yearly_salary": "255829.5",
    "skills": "aws",
    "type": "cloud"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_via": "via ZipRecruiter",
    "job_posted_date": "2023-06-18",
    "avg_yearly_salary": "255829.5",
    "skills": "databricks",
    "type": "cloud"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_via": "via ZipRecruiter",
    "job_posted_date": "2023-06-18",
    "avg_yearly_salary": "255829.5",
    "skills": "pyspark",
    "type": "libraries"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_via": "via ZipRecruiter",
    "job_posted_date": "2023-06-18",
    "avg_yearly_salary": "255829.5",
    "skills": "pandas",
    "type": "libraries"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_via": "via ZipRecruiter",
    "job_posted_date": "2023-06-18",
    "avg_yearly_salary": "255829.5",
    "skills": "jupyter",
    "type": "libraries"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_via": "via ZipRecruiter",
    "job_posted_date": "2023-06-18",
    "avg_yearly_salary": "255829.5",
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_via": "via ZipRecruiter",
    "job_posted_date": "2023-06-18",
    "avg_yearly_salary": "255829.5",
    "skills": "power bi",
    "type": "analyst_tools"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_via": "via ZipRecruiter",
    "job_posted_date": "2023-06-18",
    "avg_yearly_salary": "255829.5",
    "skills": "excel",
    "type": "analyst_tools"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_via": "via ZipRecruiter",
    "job_posted_date": "2023-06-18",
    "avg_yearly_salary": "255829.5",
    "skills": "powerpoint",
    "type": "analyst_tools"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_via": "via Indeed",
    "job_posted_date": "2023-12-05",
    "avg_yearly_salary": "232423.0",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_via": "via Indeed",
    "job_posted_date": "2023-12-05",
    "avg_yearly_salary": "232423.0",
    "skills": "r",
    "type": "programming"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_via": "via Indeed",
    "job_posted_date": "2023-12-05",
    "avg_yearly_salary": "232423.0",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_via": "via Indeed",
    "job_posted_date": "2023-12-05",
    "avg_yearly_salary": "232423.0",
    "skills": "hadoop",
    "type": "libraries"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_via": "via Indeed",
    "job_posted_date": "2023-12-05",
    "avg_yearly_salary": "232423.0",
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_via": "via Recruit.net",
    "job_posted_date": "2023-01-17",
    "avg_yearly_salary": "217000.0",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_via": "via Recruit.net",
    "job_posted_date": "2023-01-17",
    "avg_yearly_salary": "217000.0",
    "skills": "crystal",
    "type": "programming"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_via": "via Recruit.net",
    "job_posted_date": "2023-01-17",
    "avg_yearly_salary": "217000.0",
    "skills": "oracle",
    "type": "cloud"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_via": "via Recruit.net",
    "job_posted_date": "2023-01-17",
    "avg_yearly_salary": "217000.0",
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_via": "via Recruit.net",
    "job_posted_date": "2023-01-17",
    "avg_yearly_salary": "217000.0",
    "skills": "flow",
    "type": "other"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_via": "via Built In NYC",
    "job_posted_date": "2023-08-09",
    "avg_yearly_salary": "205000.0",
    "skills": "go",
    "type": "programming"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_via": "via Built In NYC",
    "job_posted_date": "2023-08-09",
    "avg_yearly_salary": "205000.0",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_via": "via Built In NYC",
    "job_posted_date": "2023-08-09",
    "avg_yearly_salary": "205000.0",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_via": "via Built In NYC",
    "job_posted_date": "2023-08-09",
    "avg_yearly_salary": "205000.0",
    "skills": "snowflake",
    "type": "cloud"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_via": "via Built In NYC",
    "job_posted_date": "2023-08-09",
    "avg_yearly_salary": "205000.0",
    "skills": "pandas",
    "type": "libraries"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_via": "via Built In NYC",
    "job_posted_date": "2023-08-09",
    "avg_yearly_salary": "205000.0",
    "skills": "numpy",
    "type": "libraries"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_via": "via Built In NYC",
    "job_posted_date": "2023-08-09",
    "avg_yearly_salary": "205000.0",
    "skills": "excel",
    "type": "analyst_tools"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_via": "via Built In NYC",
    "job_posted_date": "2023-08-09",
    "avg_yearly_salary": "205000.0",
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_via": "via Built In NYC",
    "job_posted_date": "2023-08-09",
    "avg_yearly_salary": "205000.0",
    "skills": "gitlab",
    "type": "other"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_via": "via Indeed",
    "job_posted_date": "2023-12-07",
    "avg_yearly_salary": "189309.0",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_via": "via Indeed",
    "job_posted_date": "2023-12-07",
    "avg_yearly_salary": "189309.0",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_via": "via Indeed",
    "job_posted_date": "2023-12-07",
    "avg_yearly_salary": "189309.0",
    "skills": "snowflake",
    "type": "cloud"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_via": "via Indeed",
    "job_posted_date": "2023-12-07",
    "avg_yearly_salary": "189309.0",
    "skills": "oracle",
    "type": "cloud"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_via": "via Indeed",
    "job_posted_date": "2023-12-07",
    "avg_yearly_salary": "189309.0",
    "skills": "aws",
    "type": "cloud"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_via": "via Indeed",
    "job_posted_date": "2023-12-07",
    "avg_yearly_salary": "189309.0",
    "skills": "azure",
    "type": "cloud"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_via": "via Indeed",
    "job_posted_date": "2023-12-07",
    "avg_yearly_salary": "189309.0",
    "skills": "sap",
    "type": "analyst_tools"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_via": "via Indeed",
    "job_posted_date": "2023-12-07",
    "avg_yearly_salary": "189309.0",
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_via": "via Indeed",
    "job_posted_date": "2023-12-07",
    "avg_yearly_salary": "189309.0",
    "skills": "power bi",
    "type": "analyst_tools"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_via": "via Indeed",
    "job_posted_date": "2023-12-07",
    "avg_yearly_salary": "189309.0",
    "skills": "jenkins",
    "type": "other"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_via": "via Indeed",
    "job_posted_date": "2023-12-07",
    "avg_yearly_salary": "189309.0",
    "skills": "bitbucket",
    "type": "other"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_via": "via Indeed",
    "job_posted_date": "2023-12-07",
    "avg_yearly_salary": "189309.0",
    "skills": "atlassian",
    "type": "other"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_via": "via Indeed",
    "job_posted_date": "2023-12-07",
    "avg_yearly_salary": "189309.0",
    "skills": "jira",
    "type": "async"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_via": "via Indeed",
    "job_posted_date": "2023-12-07",
    "avg_yearly_salary": "189309.0",
    "skills": "confluence",
    "type": "async"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_via": "via LinkedIn",
    "job_posted_date": "2023-01-05",
    "avg_yearly_salary": "189000.0",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_via": "via LinkedIn",
    "job_posted_date": "2023-01-05",
    "avg_yearly_salary": "189000.0",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_via": "via LinkedIn",
    "job_posted_date": "2023-01-05",
    "avg_yearly_salary": "189000.0",
    "skills": "r",
    "type": "programming"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_via": "via LinkedIn",
    "job_posted_date": "2023-01-05",
    "avg_yearly_salary": "189000.0",
    "skills": "atlassian",
    "type": "other"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_via": "via LinkedIn",
    "job_posted_date": "2023-01-05",
    "avg_yearly_salary": "189000.0",
    "skills": "bitbucket",
    "type": "other"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_via": "via LinkedIn",
    "job_posted_date": "2023-01-05",
    "avg_yearly_salary": "189000.0",
    "skills": "git",
    "type": "other"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_via": "via LinkedIn",
    "job_posted_date": "2023-01-05",
    "avg_yearly_salary": "189000.0",
    "skills": "confluence",
    "type": "async"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_via": "via LinkedIn",
    "job_posted_date": "2023-01-05",
    "avg_yearly_salary": "189000.0",
    "skills": "jira",
    "type": "async"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_via": "via Indeed",
    "job_posted_date": "2023-07-11",
    "avg_yearly_salary": "186000.0",
    "skills": "go",
    "type": "programming"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_via": "via Indeed",
    "job_posted_date": "2023-07-11",
    "avg_yearly_salary": "186000.0",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_via": "via Indeed",
    "job_posted_date": "2023-07-11",
    "avg_yearly_salary": "186000.0",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_via": "via Indeed",
    "job_posted_date": "2023-07-11",
    "avg_yearly_salary": "186000.0",
    "skills": "snowflake",
    "type": "cloud"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_via": "via Indeed",
    "job_posted_date": "2023-07-11",
    "avg_yearly_salary": "186000.0",
    "skills": "pandas",
    "type": "libraries"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_via": "via Indeed",
    "job_posted_date": "2023-07-11",
    "avg_yearly_salary": "186000.0",
    "skills": "numpy",
    "type": "libraries"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_via": "via Indeed",
    "job_posted_date": "2023-07-11",
    "avg_yearly_salary": "186000.0",
    "skills": "excel",
    "type": "analyst_tools"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_via": "via Indeed",
    "job_posted_date": "2023-07-11",
    "avg_yearly_salary": "186000.0",
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_via": "via Indeed",
    "job_posted_date": "2023-07-11",
    "avg_yearly_salary": "186000.0",
    "skills": "gitlab",
    "type": "other"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_via": "via Get.It",
    "job_posted_date": "2023-06-09",
    "avg_yearly_salary": "184000.0",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_via": "via Get.It",
    "job_posted_date": "2023-06-09",
    "avg_yearly_salary": "184000.0",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_via": "via Get.It",
    "job_posted_date": "2023-06-09",
    "avg_yearly_salary": "184000.0",
    "skills": "r",
    "type": "programming"
  }
] */