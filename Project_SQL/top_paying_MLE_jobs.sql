
SELECT
    job_id,
    job_title,
    company_dim.name AS company_name,
    job_location,
    job_posted_date,
    job_schedule_type,
    salary_year_avg
FROM 
    job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id 
WHERE
    job_title_short = 'Machine Learning Engineer' AND job_location = 'Anywhere' AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10