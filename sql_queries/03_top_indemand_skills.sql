-- Query using CTE
WITH remote_jobs_skills AS(
    SELECT 
        skill_id,
        COUNT(skills_to_jobs.job_id) AS skill_count
    FROM
        public.job_skills_dim AS skills_to_jobs
    INNER JOIN
        public.job_posting_fact AS job_postings
    ON skills_to_jobs.job_id = job_postings.job_id
    WHERE
        job_postings.job_work_from_home = TRUE AND
        job_postings.job_title_short = 'Data Analyst'
    GROUP BY
        skill_id
)

SELECT
    skills_dim.skill_id,
    skills AS skill_name,
    skill_count
FROM remote_jobs_skills
INNER JOIN
    skills_dim
ON remote_jobs_skills.skill_id = skills_dim.skill_id
ORDER BY
    skill_count DESC
LIMIT 5;

SELECT
    skills,
    COUNT(job_skills_dim.job_id) AS demand_count
FROM 
    job_posting_fact
JOIN job_skills_dim ON job_posting_fact.job_id = job_skills_dim.job_id
JOIN skills_dim ON job_skills_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY 
    skills
ORDER BY 
    demand_count DESC
LIMIT 5;

/*
OUTPUT:
[
  {
    "skills": "sql",
    "demand_count": "92628"
  },
  {
    "skills": "excel",
    "demand_count": "67031"
  },
  {
    "skills": "python",
    "demand_count": "57326"
  },
  {
    "skills": "tableau",
    "demand_count": "46554"
  },
  {
    "skills": "power bi",
    "demand_count": "39468"
  }
]
*/