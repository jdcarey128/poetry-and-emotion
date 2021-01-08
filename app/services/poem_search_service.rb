class PoemSearchService 

  def self.get_poems(author)
    response = Faraday.get("https://poetrydb.org/author/#{author}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
