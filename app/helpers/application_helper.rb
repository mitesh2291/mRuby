module ApplicationHelper


    #client.update("I just posted a status update via the Twitter Ruby Gem !")
    #redirect_to request.referer, :notice => 'Tweet successfully posted'



  def user_tweet
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


      return client.search('from:imVkohli').take(10)

      #`return tweet.text
      #`end
     # return tweet.text

    #client.user_timeline('sachin_rt') do |tweet|
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

  # noinspection RubyArgCount
  def bing_search_withRest
    require 'rubygems'
    require 'rest_client'


    #binged = Binged::Client.new(:api_key => '936B00EB84C85C18E9FC054B587F7E80')

    #web_search = Binged::Client.new.web
    #web_search.containing('ruby').from_site('www.ruby-lang.org').per_page(30).each {|result| pp result }
     # return result.text


  @key='ZP8PLNDGsSo/B2GeAgisJr8zxou0If59k18A+RXV1fQ'
      #responce= RestClient.get("https://:#{@key}@api.datamarket.azure.com/Bing/SearchWeb/v1/Web?Query='#{CGI::escape('ruby')}'&$format=json")
    response = RestClient.get 'www.bing.com',:param1 => 'ruby',:content_type => :json, :accept => :json

    return response.to_s

  end

  def bing_search

    require 'net/http'

    accountKey = 'ZP8PLNDGsSo/B2GeAgisJr8zxou0If59k18A+RXV1fQ'

    #url = 'https://api.datamarket.azure.com/Data.ashx/Bing/SearchWeb/v1/Web?Query=%27xbox%27&$top=50&$format=json'
    @padding='%27web%27&Query=%27ruby%20on%20rails%27'
    @final='https://api.datamarket.azure.com/Bing/Search/v1/Composite?Sources=%27web%27&Query=%27ruby%20on%20rails%27'
    url=@final

    uri = URI(url)

    req = Net::HTTP::Get.new(uri.request_uri)
    req.basic_auth '', accountKey

    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https'){|http|
      http.request(req)
    }
    return res.body

  end
  end
