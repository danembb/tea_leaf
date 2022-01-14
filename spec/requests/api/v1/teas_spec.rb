require 'rails_helper'

RSpec.describe 'create tea endpoint', type: :request do
    describe 'happy paths' do
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

        it 'can return a tea given a name', :vcr do
            body = {
                "name": "green"
            }

            get '/api/v1/teas/', params: body

            expect(response).to be_successful
            expect(response.status).to eq(200)

            confirmation = JSON.parse(response.body, symbolize_names: true)

            expect(confirmation).to have_key(:data)
            expect(confirmation[:data][:attributes]).to have_key(:name)
            expect(confirmation[:data][:attributes]).to have_key(:image)
            expect(confirmation[:data][:attributes]).to have_key(:description)
            expect(confirmation[:data][:attributes]).to have_key(:keywords)
            expect(confirmation[:data][:attributes]).to have_key(:origin)
            expect(confirmation[:data][:attributes]).to have_key(:brew_time)
            expect(confirmation[:data][:attributes]).to have_key(:temperature)
        end
    end
    
    describe 'sad paths' do
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

        it 'can return an error if no name is given for a tea', :vcr do
            body = {
            }

            get '/api/v1/teas/', params: body

            expect(response).to_not be_successful
            expect(response.status).to eq(400)
            
            error = JSON.parse(response.body, symbolize_names: true)

            expect(error[:error]).to eq("Invalid name provided")
        end
    end
end