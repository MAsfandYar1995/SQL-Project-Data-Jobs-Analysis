SELECT
    COUNT(job_id),
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') as month
FROM
    job_postings_fact
WHERE
    EXTRACT(YEAR FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') = 2023
GROUP BY
    month
ORDER BY
    month DESC


SELECT
    job_postings_fact.company_id AS company_id,
    company_dim.name AS company_name,
    job_postings_fact.job_posted_date::DATE AS job_posted_date
FROM 
    job_postings_fact
LEFT JOIN company_dim 
    ON job_postings_fact.company_id = company_dim.company_id 
WHERE
    (job_postings_fact.job_health_insurance = TRUE) AND
    (EXTRACT(QUARTER FROM job_postings_fact.job_posted_date) = 2 AND
    EXTRACT(YEAR FROM job_postings_fact.job_posted_date) = 2023)
ORDER BY
    job_posted_date DESC;
    