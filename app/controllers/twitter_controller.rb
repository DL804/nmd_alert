class TwitterController < ApplicationController

  def index
    @date = Time.new
    @search = TwitterHelper.check_dates 
  end

end