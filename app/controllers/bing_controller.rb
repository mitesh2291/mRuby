class BingController < ApplicationController

def index

end



  def show

    require 'net/http'

    accountKey = 'ZP8PLNDGsSo/B2GeAgisJr8zxou0If59k18A+RXV1fQ'
    @str='%27'
    #params['search_text'].to_s.strip.each { |s| @str=@str+s+'%20' }

    params['q'].to_s.split(' ').each { |s| @str=@str+'%20'+s }




    @str=@str + '%27&$format=json'
    #url = 'https://api.datamarket.azure.com/Data.ashx/Bing/SearchWeb/v1/Web?Query=%27xbox%27&$top=50&$format=json'
    #@padding='%27web%27&Query=%27ruby%20on%20rails%27'
    #@final='https://api.datamarket.azure.com/Bing/Search/v1/Composite?Sources=%27web%27&Query=%27ruby%20on%20rails%27&$format=json'
    @final='https://api.datamarket.azure.com/Bing/Search/v1/Composite?Sources=%27web%27&Query='+@str


    url=@final

    uri = URI(url)

    req = Net::HTTP::Get.new(uri.request_uri)
    req.basic_auth '', accountKey

    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https'){|http|
      http.request(req)
    }
    @bing= res.body


  end
end
