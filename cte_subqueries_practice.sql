WITH high_demand_skills AS (
    SELECT
        skill_id, 
        COUNT(job_id) AS skill_count
    FROM 
        skills_job_dim
    GROUP BY 
        skill_id
    ORDER BY 
        skill_count DESC
    LIMIT 5
)

SELECT 
    s.skill_id, 
    s.skills,
    h.skill_count
FROM 
    high_demand_skills h
JOIN 
    skills_dim s ON h.skill_id = s.skill_id;





With job_postings_count AS (
    SELECT 
        cd.name AS company_name,
        COUNT(jp.job_id) AS number_of_job_postings
    FROM 
        company_dim AS cd
    JOIN job_postings_fact AS jp
        ON cd.company_id = jp.company_id
    GROUP BY
        company_name
    ORDER BY
        number_of_job_postings DESC
)

SELECT
    company_name,
    number_of_job_postings,
    CASE
        WHEN number_of_job_postings > 50 THEN 'Large'
        WHEN number_of_job_postings BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Low'
    END AS size_category
FROM 
    job_postings_count
ORDER BY
    number_of_job_postings DESC;





WITH five_remote_skills AS (
    SELECT
        skill_id, 
        COUNT(*) AS skill_count
    FROM 
        skills_job_dim As skills_to_job
    INNER JOIN 
        job_postings_fact AS job_postings ON job_postings.job_id = skills_to_job.job_id
    WHERE
        job_postings.job_work_from_home = TRUE AND
        job_postings.job_title_short = 'Data Analyst'
    GROUP BY 
        skill_id
)

SELECT 
    skills.skill_id,
    skills AS skill_name,
    skill_count

FROM 
    five_remote_skills
INNER JOIN skills_dim AS skills ON skills.skill_id = five_remote_skills.skill_id
ORDER BY skill_count DESC
LIMIT 5