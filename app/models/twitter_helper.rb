module TwitterHelper

  def self.client 
    Twitter::REST::Client.new do |config|      
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.access_token = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
  end

  def self.load_tweets
    matches = []

    client.search("hypebeast nmd -rt").each do |tweet|
      if tweet.user.screen_name == "HYPEBEAST" && (tweet.text.include? "release")
        matches << {screenname: tweet.user.screen_name, text: tweet.text, date: tweet.created_at.strftime("%Y-%m-%d")}
      end 
    end 
    return matches
  end

  def self.check_dates
    new_tweets = []

    load_tweets.each do |tweet|
      p '*' * 50
      # p tweet[:date]
      date = Time.new
        if date.strftime("%Y-%m-%d") == tweet[:date].to_s
          new_tweets << tweet
        end 
    end 
    return new_tweets 
  end 

end 
