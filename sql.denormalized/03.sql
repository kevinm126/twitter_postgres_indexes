select lang,count(*) as count

from(
    select distinct
        data->>'id' as id_tweets,
        data->>'lang' as lang
    from tweets_jsonb
    where data->'entities'->'hashtags' @@ '$[*].text == "coronavirus"'
       OR data->'extended_tweet'->'entities'->'hashtags' @@ '$[*].text == "coronavirus"'
) as t

group by(1)
order by count DESC, lang;
