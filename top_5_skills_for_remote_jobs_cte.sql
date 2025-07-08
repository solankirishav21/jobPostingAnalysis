SELECT 
    *
FROM
    public.skills_dim;

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
        job_postings.job_work_from_home = TRUE 
        --job_postings.job_title_short = 'Data Analyst'
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