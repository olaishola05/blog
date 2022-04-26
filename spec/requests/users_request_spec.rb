require './rails_helper'

RSpec.describe 'Users', type: :request do
    describe 'GET #index' do
        before (:example) { get users_path } # get(:index) 
        it 'return response status 200 or ok' do
            expect(response).to have_http_status(:success)
            expect(response).to have_http_status(200)
            expect(response).to have_http_status(:ok)
        end

       
    end
end