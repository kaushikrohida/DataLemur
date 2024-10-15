select 
  tweet_bucket,
  count(user_id) as users_num
from (
  SELECT
    user_id,
    count(tweet_id) as tweet_bucket
  FROM tweets
  where EXTRACT(Year FROM tweet_date) = 2022
  group by user_id
) a
group by tweet_bucket