select
    tag,
    count(*) as count
from (
    select distinct
        data->>'id' as id_tweets,
        '#' || (jsonb_array_elements(data->'entities'->'hashtags' ||
                COALESCE(data->'extended_tweet'->'entities'->'hashtags','[]'))->>'text') as tag
    
        from tweets_jsonb
        where to_tsvector('english',COALESCE(data->'extended_tweet'->>'full_text',data->>'text')) @@
      to_tsquery('english','coronavirus') and data->>'lang' = 'en') as t

group by(1)
order by count DESC, tag
LIMIT 1000;
