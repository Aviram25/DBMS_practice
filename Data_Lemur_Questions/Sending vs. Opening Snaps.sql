-- Bucket users by age group
SELECT 
  age.age_bucket,

  -- % of total time spent on SEND actions within this age bucket
  ROUND(
    100.0 *
    SUM(
      CASE 
        WHEN activities.activity_type = 'send' 
        THEN activities.time_spent 
        ELSE 0 
      END
    ) / SUM(activities.time_spent),
    2
  ) AS send_perc,

  -- % of total time spent on OPEN actions within this age bucket
  ROUND(
    100.0 *
    SUM(
      CASE 
        WHEN activities.activity_type = 'open' 
        THEN activities.time_spent 
        ELSE 0 
      END
    ) / SUM(activities.time_spent),
    2
  ) AS open_perc   

-- Activity-level behavioral data
FROM activities

-- Join users to their age segmentation
INNER JOIN age_breakdown AS age 
  ON activities.user_id = age.user_id

-- Limit analysis to SEND and OPEN events only
-- (Percentages are relative to these two actions, not all activity)
WHERE activities.activity_type IN ('send','open')

-- Aggregate results per age bucket
GROUP BY age.age_bucket;
