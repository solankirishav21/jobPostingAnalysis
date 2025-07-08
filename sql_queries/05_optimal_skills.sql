-- With CTEs
WITH top_indemand_skills AS (
    SELECT
        job_skills_dim.skill_id,
        skills,
        COUNT(job_skills_dim.job_id) AS demand_count
    FROM 
        job_posting_fact
    JOIN job_skills_dim ON job_posting_fact.job_id = job_skills_dim.job_id
    JOIN skills_dim ON job_skills_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE
    GROUP BY 
        job_skills_dim.skill_id, skills
), 
avg_salary AS (
    SELECT
        job_skills_dim.skill_id,
        skills,
        ROUND(AVG(salary_year_avg)) AS avg_salary
    FROM 
        job_posting_fact
    JOIN job_skills_dim ON job_posting_fact.job_id = job_skills_dim.job_id
    JOIN skills_dim ON job_skills_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE
    GROUP BY 
        job_skills_dim.skill_id, skills
)

SELECT
     top_indemand_skills.skill_id,
     top_indemand_skills.skills,
     demand_count,
     avg_salary
FROM top_indemand_skills
JOIN avg_salary ON top_indemand_skills.skill_id = avg_salary.skill_id
WHERE demand_count > 10
ORDER BY 
    avg_salary DESC,
    demand_count DESC
LIMIT 50;

-- Without CTE
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(job_skills_dim.job_id) AS demand_count,
    ROUND(AVG(job_posting_fact.salary_year_avg)) AS avg_salary
FROM
    job_posting_fact
JOIN job_skills_dim ON job_posting_fact.job_id = job_skills_dim.job_id
JOIN skills_dim ON job_skills_dim.skill_id = skills_dim.skill_id
WHERE
    job_posting_fact.job_title_short = 'Data Analyst' AND
    job_posting_fact.salary_year_avg IS NOT NULL AND
    job_posting_fact.job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(job_skills_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 50;
