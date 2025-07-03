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





