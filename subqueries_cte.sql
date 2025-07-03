SELECT *
FROM (
    SELECT *
    FROM 
        job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 1
) AS January_jobs;

-- CTE

With january_jobs2 AS (
    SELECT *
    FROM 
        job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 1
)
SELECT * FROM january_jobs2;


With quarter1_jobs AS (
    SELECT * FROM january_jobs
    UNION ALL
    SELECT * FROM february_jobs
    UNION ALL
    SELECT * FROM march_jobs
)

SELECT 
    q1.job_location,
    q1.job_posted_date,
    q1.salary_year_avg

FROM quarter1_jobs AS q1 
WHERE q1.job_title_short = 'Data Analyst' AND q1.salary_year_avg > 70000