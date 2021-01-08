class Poem 
  attr_reader :title, 
              :author, 
              :lines,
              :tones

  def initialize(poem, tones)
    @title = poem[:title]
    @author = poem[:author]
    @lines = poem[:lines]
    @tones = get_tones(tones)
  end

  def get_tones(tones)
    tones.map do |tone|
      tone[:tone_name]
    end
  end
  
end
