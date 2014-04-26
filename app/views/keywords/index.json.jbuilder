json.array!(@keywords) do |keyword|
  json.extract! keyword, :id, :keyword, :category
  json.url keyword_url(keyword, format: :json)
end
