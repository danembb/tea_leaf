require 'rails_helper'

RSpec.describe 'tea service' do
    it 'can get a tea given a name', :vcr do
        response = TeaService.get_a_tea("oolong")

        expect(response).to be_a(Hash)
        expect(response).to have_key(:_id)
        expect(response).to have_key(:name)
        expect(response[:name]).to be_a(String)
        expect(response).to have_key(:image)
        expect(response[:image]).to be_a(String)
        expect(response).to have_key(:description)
        expect(response[:description]).to be_a(String)
        expect(response).to have_key(:keywords)
        expect(response[:keywords]).to be_a(String)
        expect(response).to have_key(:origin)
        expect(response[:origin]).to be_a(String)
        expect(response).to have_key(:brew_time)
        expect(response[:brew_time]).to be_a(Integer)
        expect(response).to have_key(:temperature)
        expect(response[:temperature]).to be_an(Integer)
        expect(response).to have_key(:comments)
        expect(response[:comments]).to be_an(Array)
        expect(response[:comments].first).to be_a(Hash)
    end
end