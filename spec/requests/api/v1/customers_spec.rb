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
        end
    end
end