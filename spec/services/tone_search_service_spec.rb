require 'rails_helper' 

RSpec.describe 'Tone Search Service' do 
  it 'returns a parsed array of document tones' do 
    text = "Not at Home to Callers, Says the Naked Tree --, Bonnet due in April --,Wishing you Good Day --"
    json = ToneSearchService.get_tones(text)

    tones = json[:document_tone][:tones]
    first = tones[0]

    expect(tones).to be_a(Array)
    
    expect(first).to have_key(:score)
    expect(first[:score]).to be_a(Float)

    expect(first).to have_key(:tone_id)
    expect(first[:tone_id]).to be_a(String)

    expect(first).to have_key(:tone_name)
    expect(first[:tone_name]).to be_a(String)
  end
end
