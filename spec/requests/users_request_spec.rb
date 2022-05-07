require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path } # get(:index)

    it 'return response status 200 or ok' do
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:ok)
    end

    it 'should render template index' do
      expect(response).to render_template('index')
    end

    it 'Should return response body text' do
      expect(response.body).to include('Number of posts')
    end
  end

  describe 'GET #show' do
    before(:example) { get user_path(4) } # get(:show, params: { id: 1 })

    it 'return response status 200 or ok' do
      expect(response).to have_http_status(:success)
    end

    it 'Should return response body text' do
      expect(response.body).to include('Number of posts')
    end

    it 'Should render template show' do
      expect(response).to render_template('show')
    end
  end
end
