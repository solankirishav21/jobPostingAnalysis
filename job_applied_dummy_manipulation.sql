CREATE TABLE job_applied(
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

SELECT * 
FROM job_applied;

INSERT INTO job_applied
 (
    job_id, 
    application_sent_date, 
    custom_resume, 
    resume_file_name, 
    cover_letter_sent, 
    cover_letter_file_name, 
    status
 )
 VALUES (
    1,
    '2025-07-07',
    true,
    'resume_1.pdf',
    true,
    'cover_letter_1.pdf',
    'submitted'
 ),
 (
    2,
    '2025-07-08',
    false,
    'resume_2.pdf',
    false,
    NULL,
    'in_progress'
 ),
 (
    3,
    '2025-07-09',
    true,
    'resume_3.pdf',
    true,
    'cover_letter_3.pdf',
    'submitted'
 ),
 (
    4,
    '2025-07-10',
    false,
    'resume_4.pdf',
    true,
    'cover_letter_4.pdf',
    'submitted'
 ),
 (
    5,
    '2025-07-11',
    true,
    'resume_5.pdf',
    false,
    NULL,
    'in_progress'
 ),
(
    6,
    '2025-07-12',
    true,
    'resume_6.pdf',
    true,
    'cover_letter_6.pdf',
    'submitted'
 ),
 (
    7,
    '2025-07-13',
    false,
    'resume_7.pdf',
    false,
    NULL,
    'in_progress'
 ),
 (
    8,
    '2025-07-14',
    true,
    'resume_8.pdf',
    true,
    'cover_letter_8.pdf',
    'submitted'
 ),
 (
    9,
    '2025-07-15',
    false,
    'resume_9.pdf',
    true,
    'cover_letter_9.pdf',
    'submitted'
 ),
 (
     10,
     '2025-07-16',
     true,
     'resume_10.pdf',
     false,
     NULL,
     'in_progress'
);

SELECT *
FROM job_applied;

ALTER TABLE job_applied
ADD contact VARCHAR(50);
 
UPDATE job_applied
SET contact = 'Eric Bishop'
WHERE job_id = 1;

UPDATE job_applied
SET contact = 'John Doe'
WHERE job_id = 2;

UPDATE job_applied
SET contact = 'Jane Smith'
WHERE job_id = 3;   

UPDATE job_applied  
SET contact = 'Alice Johnson'
WHERE job_id = 4;

UPDATE job_applied
SET contact = 'Bob Brown'
WHERE job_id = 5;

UPDATE job_applied
SET contact = 'Charlie Davis'
WHERE job_id = 6;

UPDATE job_applied
SET contact = 'Diana Evans' 
WHERE job_id = 7;

UPDATE job_applied
SET contact = 'Ethan Green'
WHERE job_id = 8;

UPDATE job_applied
SET contact = 'Fiona Harris'    
WHERE job_id = 9;

UPDATE job_applied
SET contact = 'George King' 
WHERE job_id = 10;

SELECT *
FROM job_applied;

ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;

SELECT *
FROM job_applied;

ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

ALTER TABLE job_applied
DROP COLUMN contact_name;

SELECT *
FROM job_applied;

DROP TABLE job_applied;