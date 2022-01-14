require 'rails_helper'

RSpec.describe TeaPoro do
    it 'exists and has attributes' do
        tea = TeaPoro.new(name: "guava bombas tea", image: "www.tea.biz/gbt", description: "mysterious and rare tea", keywords: "rare, restorative", origin: "Madagascar", brew_time: 4, temperature: 88, comments: [{notes: "wow"}, {notes: "still wow"}])

        expect(tea).to be_a(TeaPoro)
        expect(tea.name).to eq("guava bombas tea")
        expect(tea.image).to eq("www.tea.biz/gbt")
        expect(tea.description).to eq("mysterious and rare tea")
        expect(tea.keywords).to eq("rare, restorative")
        expect(tea.origin).to eq("Madagascar")
        expect(tea.brew_time).to eq(4)
        expect(tea.temperature).to eq(88)
        expect(tea.comments).to eq([{notes: "wow"}, {notes: "still wow"}])
    end
end