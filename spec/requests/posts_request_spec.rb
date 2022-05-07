require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:example) { get '/users/4/posts' } # get(:index)

    it 'return response status 200 or ok' do
      # expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:ok)
    end

    it 'return response body text' do
      expect(response.body).to include('Number of posts')
    end

    it 'should render template index' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    before(:example) { get '/users/4/posts/1' }

    it 'return response status 200 or ok' do
      expect(response).to have_http_status(:success)
    end

    it 'return response body text' do
      expect(response.body).to include('Add comment to post')
    end

    it 'should render template show' do
      expect(response).to render_template('show')
    end
  end
end
