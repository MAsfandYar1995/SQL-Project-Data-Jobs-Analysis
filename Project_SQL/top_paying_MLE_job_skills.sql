
With Highest_MLE_Jobs AS (
    SELECT
        job_id,
        job_title,
        company_dim.name AS company_name,
        job_location,
        salary_year_avg
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id 
    WHERE
        job_title_short = 'Machine Learning Engineer' AND job_location = 'Anywhere' AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    Highest_MLE_Jobs.*,
    skills_dim.skills
FROM 
    Highest_MLE_Jobs
INNER JOIN skills_job_dim ON Highest_MLE_Jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
