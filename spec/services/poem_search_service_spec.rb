require 'rails_helper'

RSpec.describe 'Poem Search Service' do 
  describe 'get_poems' do 
    it 'returns a parsed json array of poems' do 
      json = PoemSearchService.get_poems('Emily')
      first = json[0]

      expect(json).to be_a(Array)

      expect(first).to have_key(:title)
      expect(first[:title]).to be_a(String)

      expect(first).to have_key(:author)
      expect(first[:author]).to be_a(String)

      expect(first).to have_key(:lines)
      expect(first[:lines]).to be_a(Array)
      expect(first[:lines][0]).to be_a(String)

      expect(first).to have_key(:linecount)
      expect(first[:linecount]).to be_a(String)
    end
  end
end
