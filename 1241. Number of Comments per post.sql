WITH Posts as (
    SELECT DISTINCT
        sub_id as post_id
    FROM
        Submissions
    WHERE
        parent_id IS NULL
)

SELECT
    Posts.post_id,
    COUNT(Distinct Submissions.sub_id) as number_of_comments
FROM
    Posts
LEFT JOIN 
    Submissions
ON
    Posts.post_id = Submissions.parent_id
GROUP BY
    Posts.post_id
ORDER BY
    Posts.post_id ASC
