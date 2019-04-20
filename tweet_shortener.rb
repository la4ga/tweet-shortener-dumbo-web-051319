require 'pry'

def dictionary
	substitute_hash = {
		"hello": "hi",
		"too": "2",
		"to": "2",
		"two": "2",
		"for": "4",
		"four": "4",
		"be": "b",
		"you": "u",
		"at": "@",
		"and": "&"
	}
end

def word_substituter(tweet)
  dictionary.each do |long, short|
    tweet.gsub!(" #{long.to_s} ", " #{short} ")
    tweet.gsub!(" #{long.to_s.capitalize} ", " #{short} ")
  end

  tweet
end

def bulk_tweet_shortener(tweets)
	tweets.each do |tweet|
		puts word_substituter(tweet)
	end
end

def selective_tweet_shortener(tweet)
	tweet = word_substituter(tweet) if tweet.size > 140
	tweet
end

def shortened_tweet_truncator(tweet)
	if tweet.size > 140
		tweet = word_substituter(tweet)
		if tweet.size > 140
			tweet = tweet[0..136] << "..."
		end
	end

	tweet
end