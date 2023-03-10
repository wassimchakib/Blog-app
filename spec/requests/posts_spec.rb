require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET /users/:user_id/posts' do
    before(:each) do
      get '/users/1/posts'
    end

    # Get lists of all posts
    it 'returns a 200 status response' do
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    # It should render template correctly
    it 'Renders the correct template' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    before(:each) do
      get '/users/1/posts/2'
    end

    # Get lists of all posts
    it 'returns a 200 status response' do
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    # It should render template correctly
    it 'Renders the correct template' do
      expect(response).to render_template('show')
    end
  end
end
