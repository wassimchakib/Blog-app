require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET /users/:user_id/posts' do
    before(:each) do
      @user = User.create(
        name: 'Wassim Chakib',
        photo: 'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
        bio: 'Software engineer',
        postsCounter: 0
      )

      @post = Post.create(
        author: @user,
        title: 'My first post',
        text: 'This is my first post in my page where I will talk about software development!',
        commentsCounter: 5,
        likesCounter: 47
      )

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

    # It should have correct response body text
    it 'has correct body text' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    before(:each) do
      @user = User.create(
        name: 'Wassim Chakib',
        photo: 'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
        bio: 'Software engineer',
        postsCounter: 0
      )

      @post = Post.create(
        author: @user,
        title: 'My first post',
        text: 'This is my first post in my page where I will talk about software development!',
        commentsCounter: 5,
        likesCounter: 47
      )

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

    # It should have correct response body text
    it 'has correct body text' do
      expect(response.body).to include('Here is a single post for a given user')
    end
  end
end
