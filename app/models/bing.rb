class Bing
  include MongoMapper::Document

  key :searchKeyword, String
  key :searchResult,  String

end
