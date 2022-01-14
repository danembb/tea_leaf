require 'rails_helper'

RSpec.describe 'create tea endpoint', type: :request do
    describe 'happy path' do
        it 'can create a tea' do
            body = {
                    "name": "green",
                    "image": "www.pixiv.com/wowgreentea",
                    "description": "a greenish hue and lovely scent",
                    "keywords": "earthy, calming",
                    "origin": "?",
                    "brew_time": 3,
                    "temperature": 92.2
            }

            headers = { 'CONTENT_TYPE': 'application/json', "Accept": 'application/json' }

            post '/api/v1/teas', headers: headers, params: body, as: :json
            
            expect(response).to be_successful
            expect(response.status).to eq(201)
            
            confirmation = JSON.parse(response.body, symbolize_names: true)
            
            expect(confirmation).to have_key(:data)
            expect(confirmation[:data]).to be_a(Hash)
            expect(confirmation[:data][:attributes][:name]).to eq("green")
            expect(confirmation[:data][:attributes][:image]).to eq("www.pixiv.com/wowgreentea")
            expect(confirmation[:data][:attributes][:description]).to eq("a greenish hue and lovely scent")
            expect(confirmation[:data][:attributes][:keywords]).to eq("earthy, calming")
            expect(confirmation[:data][:attributes][:origin]).to eq("?")
            expect(confirmation[:data][:attributes][:brew_time]).to eq(3)
            expect(confirmation[:data][:attributes][:temperature]).to eq(92.2)
        end
    end
    
    describe 'sad path' do
        it 'can return an error if insufficient parameters are provided' do
            body = {
                    "name": "green",
                    "image": "www.pixiv.com/wowgreentea",
                    "keywords": "earthy, calming",
                    "origin": "?",
                    "brew_time": 3,
                    "temperature": 92.2
            }

            headers = { 'CONTENT_TYPE': 'application/json', "Accept": 'application/json' }

            post '/api/v1/teas', headers: headers, params: body, as: :json

            expect(response).to_not be_successful
            expect(response.status).to eq(400)

            error = JSON.parse(response.body, symbolize_names: true)

            expect(error[:error]).to eq("Insufficient parameters provided")
        end
    end
end