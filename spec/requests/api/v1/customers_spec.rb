require 'rails_helper'

RSpec.describe 'create customer endpoint', type: :request do
    describe 'happy path' do
        it 'can create a customer', :vcr do
            body = {
                    "first_name": "dane",
                    "last_name": "brophy",
                    "email": "dbrophy@cats.biz",
                    "address": "101 Generic Drive, Ware, CO"
            }

            headers = { 'CONTENT_TYPE': 'application/json', "Accept": 'application/json' }

            post '/api/v1/customers', headers: headers, params: body, as: :json
            
            expect(response).to be_successful
            expect(response.status).to eq(201)
            
            confirmation = JSON.parse(response.body, symbolize_names: true)
            
            expect(confirmation).to have_key(:data)
            expect(confirmation[:data]).to be_a(Hash)
            expect(confirmation[:data][:first_name]).to eq("dane")
            expect(confirmation[:data][:last_name]).to eq("brophy")
            expect(confirmation[:data][:email]).to eq("dbrophy@cats.biz")
            expect(confirmation[:data][:address]).to eq("101 Generic Drive, Ware, CO")
        end
    end
    
    describe 'sad path' do
        it 'can return an error if insufficient parameters are provided', :vcr do
            body = {
                    "first_name": "dane",
                    "last_name": "brophy",
                    "email": "dbrophy@cats.biz",
            }
        
            headers = { 'CONTENT_TYPE': 'application/json', "Accept": 'application/json' }
        
            post '/api/v1/customers', headers: headers, params: body, as: :json

            expect(response).to_not be_successful
            expect(response.status).to eq(400)

            error = JSON.parse(response.body, symbolize_names: true)

            expect(error[:error]).to eq("Insufficient parameters provided")
        end
    end
end