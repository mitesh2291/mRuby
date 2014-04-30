class BingController < ApplicationController

def index

end



  def show

    require 'net/http'
    #Check Keyword entry is there in database or not
    @count=Bing.where(:searchKeyword=>params['q']).count
    @check
    #if its in database retrieve from database
    if @count < 1 then

      #else Retrieve from Web

      accountKey = 'ZP8PLNDGsSo/B2GeAgisJr8zxou0If59k18A+RXV1fQ'
      @str='%27'
      #params['search_text'].to_s.strip.each { |s| @str=@str+s+'%20' }
      params['q'].to_s.split(' ').each { |s| @str=@str+'%20'+s }
      @str=@str + '%27&$format=json'

      #@final='https://api.datamarket.azure.com/Bing/Search/v1/Composite?Sources=%27web%27&Query=%27ruby%20on%20rails%27&$format=json'

      @final='https://api.datamarket.azure.com/Bing/Search/v1/Composite?Sources=%27web%27&Query='+@str

      url=@final

      uri = URI(url)

      req = Net::HTTP::Get.new(uri.request_uri)

      req.basic_auth '', accountKey

      res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') { |http|
        http.request(req)
      }
      # SearchResult contain data from web and store it to database
      @WebSearchResult= res.body
      #@SearchResult='hello i m mitesh'
      Bing.new(:searchKeyword=>params['q'], :searchResult=> @WebSearchResult).save
    else

      #SarchResult contain data from database not web
      #@SearchResult=Bing.where(:searchKeyword=>params['q'])
      @SearchResult=Bing.where(:searchKeyword=>params['q'])
      render :dShow
      #return @SearchResult
    end
  end

  def dShow
    #@databaseSearch=Bing.find_by_searchKeyword(params['j'])
   #@databaseSearch=Bing.where(:searchKeyword=>params['j'])

    return @SearchResult
    #@test=params['j']
  end
end
