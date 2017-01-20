class TwitterController < ApplicationController

  def index
    @date = Time.new
    @search = TwitterHelper.load_tweets

    @search.each do |tweet|
      TwilioHelper.send_message(tweet)
    end 
  end

end