CREATE TABLE januanry_job_postings AS
    SELECT *
    FROM job_posting_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE febuary_job_postings AS
    SELECT *
    FROM job_posting_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE march_job_postings AS
    SELECT *
    FROM job_posting_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

CREATE TABLE april_job_postings AS
    SELECT *
    FROM job_posting_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 4;

CREATE TABLE may_job_postings AS
    SELECT *
    FROM job_posting_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 5;

CREATE TABLE june_job_postings AS
    SELECT *    
    FROM job_posting_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 6;

CREATE TABLE july_job_postings AS
    SELECT *
    FROM job_posting_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 7;

CREATE TABLE august_job_postings AS
    SELECT *
    FROM job_posting_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 8;

CREATE TABLE september_job_postings AS
    SELECT *
    FROM job_posting_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 9;

CREATE TABLE october_job_postings AS
    SELECT *
    FROM job_posting_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 10;

CREATE TABLE november_job_postings AS
    SELECT *
    FROM job_posting_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 11;

CREATE TABLE december_job_postings AS
    SELECT *   
    FROM job_posting_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 12;

SELECT * FROM januanry_job_postings LIMIT 10;
SELECT * FROM febuary_job_postings LIMIT 10;
SELECT * FROM march_job_postings LIMIT 10;  
SELECT * FROM april_job_postings LIMIT 10;
SELECT * FROM may_job_postings LIMIT 10;
SELECT * FROM june_job_postings LIMIT 10;
SELECT * FROM july_job_postings LIMIT 10;
SELECT * FROM august_job_postings LIMIT 10;
SELECT * FROM september_job_postings LIMIT 10;
SELECT * FROM october_job_postings LIMIT 10;
SELECT * FROM november_job_postings LIMIT 10;
SELECT * FROM december_job_postings LIMIT 10;