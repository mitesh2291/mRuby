class Tweet
  include MongoMapper::Document
  key :username, String
  key :post, String

end
