require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'GET /users/' do
    before(:each) do
      get '/users'
    end

    # Get lists of all users
    it 'returns a 200 status response' do
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    # It should render template correctly
    it 'Renders the correct template' do
      expect(response).to render_template('index')
    end

    # It should have correct response body text
    it 'has correct body text' do
      expect(response.body).to include('Here is a list of users')
    end
  end

  describe 'GET /users/:user_id' do
    before(:each) do
      get '/users/1'
    end

    # Get Specific User
    it 'returns a 200 status response' do
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    # It should render template correctly
    it 'Renders the correct template' do
      expect(response).to render_template('show')
    end

    # It should have correct response body text
    it 'has correct body text' do
      expect(response.body).to include('Here is a single user')
    end
  end
end
