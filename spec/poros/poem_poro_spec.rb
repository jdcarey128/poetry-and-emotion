require 'rails_helper' 

RSpec.describe 'Poem Poro' do 
  it 'exists and has attributes' do 
    data = {:title=>"Not at Home to Callers",
      :author=>"Emily Dickinson",
      :lines=>["Not at Home to Callers", "Says the Naked Tree --", "Bonnet due in April --", "Wishing you Good Day --"],
      :linecount=>"4"}

    tones = [{
      "score": 0.730959,
      "tone_id": "joy",
      "tone_name": "Joy"
  }]
    
    poem = Poem.new(data, tones)
    expect(poem.title).to eq('Not at Home to Callers')
    expect(poem.author).to eq('Emily Dickinson')
    expect(poem.lines).to eq(["Not at Home to Callers", "Says the Naked Tree --", "Bonnet due in April --", "Wishing you Good Day --"])
    expect(poem.tones).to eq(['Joy'])
  end
end
