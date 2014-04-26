class Keyword
  include MongoMapper::Document

  key :keyword, String
  key :category, String

end
