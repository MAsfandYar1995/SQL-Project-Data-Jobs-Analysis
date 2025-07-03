CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

SELECT * FROM job_applied

INSERT INTO job_applied 
    (job_id,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status)

VALUES
    (1,
    '2025-02-01',
    true,
    'resume_01.pdf',
    true,
    'cover_letter_01.pdf',
    'submitted'),
    (2,
    '2025-03-01',
    true,
    'resume_02.pdf',
    true,
    'cover_letter_02.pdf',
    'submitted'),
    (3,
    '2025-02-11',
    true,
    'resume_03.pdf',
    true,
    'cover_letter_03.pdf',
    'ghosted'),
    (4,
    '2025-05-01',
    true,
    'resume_04.pdf',
    true,
    'cover_letter_04.pdf',
    'submitted'),
    (5,
    '2025-02-24',
    true,
    'resume_05.pdf',
    true,
    'cover_letter_05.pdf',
    'rejected');

SELECT * FROM job_applied

ALTER TABLE job_applied
ADD contact VARCHAR(50);

SELECT * FROM job_applied

UPDATE job_applied
SET contact = 'M Asfand Yar'
WHERE job_id = 2;

SELECT * FROM job_applied

UPDATE job_applied
SET contact = 'Andrew S'
WHERE job_id = 1;

UPDATE job_applied
SET contact = 'George'
WHERE job_id = 2;

UPDATE job_applied
SET contact = 'Anna'
WHERE job_id = 3;

UPDATE job_applied
SET contact = 'Joseph'
WHERE job_id = 4;

UPDATE job_applied
SET contact = 'Mary'
WHERE job_id = 5;

ALTER TABLE job_applied
RENAME COLUMN contact TO "contact no.";

ALTER TABLE job_applied
RENAME COLUMN status TO App_Status;

ALTER TABLE job_applied
ALTER COLUMN "contact no." TYPE TEXT;


ALTER TABLE job_applied
DROP COLUMN "contact no."

DROP TABLE job_applied