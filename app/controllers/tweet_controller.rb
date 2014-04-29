class TweetController < ApplicationController

def index
 # redirect_to :action => :user_tweet

  require 'rubygems'
  require 'twitter'

  # Certain methods require authentication. To get your Twitter OAuth credentials,
  # register an app at http://dev.twitter.com/apps


  #client = Twitter::REST::Client.new do |config|
   # config.consumer_key = 'olIBPJf1fjDEzvRSVPtn2BCpe'
    #config.consumer_secret =  'QoptvqqR0tVDjDWcrtrx2JP0w3czRjCyXXyX35UksPPE31LcwA'
    #config.oauth_token = '2463638708-fhAJ3Vo3bScb8lHoJ0M1ghzwDnxm3qrqFqmDc9H'
    #config.oauth_token_secret = 'vmZrU1GS6Cjs03KKIKQvGAPHoN8TrodRI4Wb5VzrrlY49'
  #end

  #@search=params['search_text']
  #return @search

  #@tweet=client.search('imVkohli').take(10)
  #render :template => 'tweet/show'
  #@tweet=client.search(@search).take(10)
#@tweet='Hello my first tweet'

end
  def show
    require 'rubygems'
    require 'twitter'

    # Certain methods require authentication. To get your Twitter OAuth credentials,
    # register an app at http://dev.twitter.com/apps


    client = Twitter::REST::Client.new do |config|
      config.consumer_key = 'olIBPJf1fjDEzvRSVPtn2BCpe'
      config.consumer_secret =  'QoptvqqR0tVDjDWcrtrx2JP0w3czRjCyXXyX35UksPPE31LcwA'
      config.oauth_token = '2463638708-fhAJ3Vo3bScb8lHoJ0M1ghzwDnxm3qrqFqmDc9H'
      config.oauth_token_secret = 'vmZrU1GS6Cjs03KKIKQvGAPHoN8TrodRI4Wb5VzrrlY49'
    end

    @search=params['q']
    @tweet=client.search(@search).take(10)
    render :template => 'tweet/show'

end
    # @tweets = Twitter.user_timeline[0..4] # For this demonstration lets keep the tweets limited to the first 5 available.
    #client = Twitter::Client.new

    #client.sample do |tweet|
    #`` puts tweet.text
    #`end
    #client.caller_locations do |location|
    # return location.text

    #client.user('mitesh2291') do |tweet|
    #client.search('from:sachin_rt', :result_type => 'recent').take(3).each do |tweet|
    # return tweet.text
    #end



    #`return tweet.text
    #`end
    # return tweet.text

    #client.statuses('sachin_rt') do |tweet|
    # return tweet.text
    #end


    #list = URI.parse('https://twitter.com/sachin_rt')
    #client.list_timeline(list) do |tweet|
    # return tweet.text
    #end


    #end

    #@tweets = Twitter.user_timeline[0..4] # For this demonstration lets keep the tweets limited to the first 5 available.
    #puts Twitter.user("mitesh2291").location
    # Initialize your Twitter client
    #client = Twitter::Client.new

    # Post a status update
    #client.update("I just posted a status update via the Twitter Ruby Gem !")
    #redirect_to request.referer, :notice => 'Tweet successfully posted'

end
