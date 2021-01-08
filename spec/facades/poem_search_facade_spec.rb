require 'rails_helper'

RSpec.describe 'Poem Search Facade' do 
  it 'returns an array of poem objects' do 
    poems = PoemSearchFacade.get_poems('Emily')

    expect(poems).to be_a(Array)
    expect(poems[0]).to be_a(Poem)
  end

end
