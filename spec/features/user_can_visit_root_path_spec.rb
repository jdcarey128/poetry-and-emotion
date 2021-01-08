require 'rails_helper'

describe "User can visit root path" do
  it "to see a search form" do
    visit '/'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Welcome to Poetry and Emotion')
    expect(page).to have_selector('input')
  end
end

RSpec.feature "As a user when I fill in 'Emily' to the textfield and click 'Get Poems'" do 
  before :each do 
    visit root_path 

    fill_in :author, with: 'Emily' 
    click_on 'Get Poems'
  end
  
  it 'I see a list of the first 10 poems' do 
    expect(current_path).to eq(search_path)
    
    expect(page).to have_css('.poem', count:10)
    expect(page).to have_content('Emily Dickinson')
    expect(page).to have_content('Emily Bronte')

    within(first('.poem')) do 
      expect(page).to have_content('Not at Home to Callers')
      expect(page).to have_content('Emily Dickinson')
      expect(page).to have_content('Says the Naked Tree')
    end
  end

  it 'I see the tone(s) for each poem' do 
    within(first('.poem')) do 
      expect(page).to have_content('Joy')
    end
  end

end
