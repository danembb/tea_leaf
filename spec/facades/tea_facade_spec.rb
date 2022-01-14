require 'rails_helper'

RSpec.describe 'tea facade' do
    it 'can return a single tea given a name', :vcr do
        tea = TeaFacade.one_tea("oolong")

        expect(tea).to be_a(TeaPoro)
        expect(tea.id).to be_a(String)
        expect(tea.name).to be_a(String)
        expect(tea.image).to be_a(String)
        expect(tea.description).to be_a(String)
        expect(tea.keywords).to be_a(String)
        expect(tea.origin).to be_a(String)
        expect(tea.brew_time).to be_an(Integer)
        expect(tea.temperature).to be_an(Integer)
        expect(tea.comments).to be_an(Array)
    end
end