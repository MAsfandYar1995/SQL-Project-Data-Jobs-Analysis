SELECT
    job_title_short,
    job_schedule_type,
    AVG(salary_year_avg) AS avg_year_salary,
    AVG(salary_hour_avg) AS avg_hour_salary
FROM
    job_postings_fact
WHERE
    job_posted_date > DATE '2023-06-01'
GROUP BY
    job_schedule_type;