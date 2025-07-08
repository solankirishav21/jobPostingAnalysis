
SELECT
    skills,
    ROUND(AVG(salary_year_avg)) AS avg_salary
FROM 
    job_posting_fact
JOIN job_skills_dim ON job_posting_fact.job_id = job_skills_dim.job_id
JOIN skills_dim ON job_skills_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY 
    skills
ORDER BY 
    avg_salary DESC
LIMIT 50;


-- Output:
/*
[
  {
    "skills": "svn",
    "avg_salary": "400000"
  },
  {
    "skills": "solidity",
    "avg_salary": "179000"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "golang",
    "avg_salary": "155000"
  },
  {
    "skills": "mxnet",
    "avg_salary": "149000"
  },
  {
    "skills": "dplyr",
    "avg_salary": "147633"
  },
  {
    "skills": "vmware",
    "avg_salary": "147500"
  },
  {
    "skills": "terraform",
    "avg_salary": "146734"
  },
  {
    "skills": "twilio",
    "avg_salary": "138500"
  },
  {
    "skills": "gitlab",
    "avg_salary": "134126"
  },
  {
    "skills": "kafka",
    "avg_salary": "129999"
  },
  {
    "skills": "puppet",
    "avg_salary": "129820"
  },
  {
    "skills": "keras",
    "avg_salary": "127013"
  },
  {
    "skills": "pytorch",
    "avg_salary": "125226"
  },
  {
    "skills": "perl",
    "avg_salary": "124686"
  },
  {
    "skills": "ansible",
    "avg_salary": "124370"
  },
  {
    "skills": "hugging face",
    "avg_salary": "123950"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "120647"
  },
  {
    "skills": "cassandra",
    "avg_salary": "118407"
  },
  {
    "skills": "notion",
    "avg_salary": "118092"
  },
  {
    "skills": "atlassian",
    "avg_salary": "117966"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "116712"
  },
  {
    "skills": "airflow",
    "avg_salary": "116387"
  },
  {
    "skills": "scala",
    "avg_salary": "115480"
  },
  {
    "skills": "linux",
    "avg_salary": "114883"
  },
  {
    "skills": "confluence",
    "avg_salary": "114153"
  },
  {
    "skills": "pyspark",
    "avg_salary": "114058"
  },
  {
    "skills": "mongodb",
    "avg_salary": "113608"
  },
  {
    "skills": "aurora",
    "avg_salary": "113394"
  },
  {
    "skills": "cordova",
    "avg_salary": "113270"
  },
  {
    "skills": "gcp",
    "avg_salary": "113065"
  },
  {
    "skills": "spark",
    "avg_salary": "113002"
  },
  {
    "skills": "splunk",
    "avg_salary": "112928"
  },
  {
    "skills": "databricks",
    "avg_salary": "112881"
  },
  {
    "skills": "unify",
    "avg_salary": "112317"
  },
  {
    "skills": "git",
    "avg_salary": "112250"
  },
  {
    "skills": "dynamodb",
    "avg_salary": "111840"
  },
  {
    "skills": "snowflake",
    "avg_salary": "111578"
  },
  {
    "skills": "shell",
    "avg_salary": "111496"
  },
  {
    "skills": "electron",
    "avg_salary": "111175"
  },
  {
    "skills": "unix",
    "avg_salary": "111123"
  },
  {
    "skills": "hadoop",
    "avg_salary": "110888"
  },
  {
    "skills": "pandas",
    "avg_salary": "110767"
  },
  {
    "skills": "node.js",
    "avg_salary": "110230"
  },
  {
    "skills": "phoenix",
    "avg_salary": "109259"
  },
  {
    "skills": "php",
    "avg_salary": "109052"
  },
  {
    "skills": "neo4j",
    "avg_salary": "108646"
  },
  {
    "skills": "nosql",
    "avg_salary": "108331"
  },
  {
    "skills": "express",
    "avg_salary": "108221"
  }
]*/