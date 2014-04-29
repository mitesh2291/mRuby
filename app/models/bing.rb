class Bing
  include MongoMapper::Document

  key :keyword, String
  key :searchResult,  String

end
