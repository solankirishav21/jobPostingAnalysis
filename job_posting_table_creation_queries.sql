-- company dimension table
CREATE TABLE public.company_dim(
    company_id INT PRIMARY KEY,
    name VARCHAR(100),
    link TEXT,
    link_google TEXT,
    thumbnail TEXT
);
ALTER TABLE public.company_dim
ALTER COLUMN name TYPE TEXT;

-- skills dimension table
CREATE TABLE public.skills_dim(
    skill_id INT PRIMARY KEY,
    skills TEXT,
    TYPE TEXT
);

-- job posting fact table
CREATE TABLE public.job_posting_fact(
    job_id INT PRIMARY KEY,
    company_id INT,
    job_title_short VARCHAR(255),
    job_title TEXT,
    job_location TEXT,
    job_via TEXT,
    job_schedule_type TEXT,
    job_work_from_home BOOLEAN,
    search_location TEXT,
    job_posted_date TIMESTAMP,
    job_no_degree_mention BOOLEAN,
    job_health_insurance BOOLEAN,
    job_country TEXT,
    salary_rate TEXT,
    salary_year_avg NUMERIC,
    salary_hour_avg NUMERIC,
    FOREIGN KEY (company_id) REFERENCES public.company_dim(company_id)
);

-- job skills dimension table
CREATE TABLE public.job_skills_dim(
    job_id INT,
    skill_id INT,
    FOREIGN KEY (job_id) REFERENCES public.job_posting_fact(job_id),
    FOREIGN KEY (skill_id) REFERENCES public.skills_dim(skill_id) 
);

-- Ownership of the tables
ALTER TABLE public.company_dim OWNER to postgres;
ALTER TABLE public.skills_dim OWNER to postgres;
ALTER TABLE public.job_posting_fact OWNER to postgres;
ALTER TABLE public.job_skills_dim OWNER to postgres;

-- Indexes on FK for performance optimization
CREATE INDEX idx_company_id ON public.job_posting_fact(company_id);
CREATE INDEX idx_skill_id ON public.job_skills_dim(skill_id);
CREATE INDEX idx_job_id ON public.job_skills_dim(job_id);

-- Copying data from csv files into the table
-- Permisson denied error so using \copy command in PSQL Tool
/*
\copy company_dim FROM 'C:\Users\Rishav Singh Solanki\Desktop\data analysis\sql\csv_files\company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_dim FROM 'C:\Users\Rishav Singh Solanki\Desktop\data analysis\sql\csv_files\skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy job_posting_fact FROM 'C:\Users\Rishav Singh Solanki\Desktop\data analysis\sql\csv_files\job_posting_fact.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy job_skills_dim FROM 'C:\Users\Rishav Singh Solanki\Desktop\data analysis\sql\csv_files\job_skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

*/
SELECT * FROM public.company_dim;
SELECT * FROM public.skills_dim;
SELECT * FROM public.job_posting_fact LIMIT 100;
SELECT * FROM public.job_skills_dim LIMIT 100;


