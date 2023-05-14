create index on tweet_tags(tag, id_tweets);

create index on tweets(id_tweets, lang);

create index on tweet_tags(id_tweets, tag);

create index on tweets USING gin(to_tsvector('english', text));
