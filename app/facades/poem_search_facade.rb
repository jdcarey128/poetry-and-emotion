class PoemSearchFacade

  def self.get_poems(author)
    json = ::PoemSearchService.get_poems(author)
    json.map do |poem|
      tones = get_tones(poem[:lines].join)
      Poem.new(poem, tones)
    end
  end
  
  def self.get_tones(lines)
    ::ToneSearchService.get_tones(lines)[:document_tone][:tones]
  end
  
end
