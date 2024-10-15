SELECT 
  tweet_bucket,
  COUNT(user_id) AS users_num
FROM (
  SELECT
    user_id,
    COUNT(tweet_id) AS tweet_bucket
  FROM tweets
  WHERE EXTRACT(YEAR FROM tweet_date) = 2022
  GROUP BY user_id
) a
GROUP BY tweet_bucket
ORDER BY tweet_bucket
