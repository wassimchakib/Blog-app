require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'john', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', bio: 'dev', postsCounter: 0) }
  let(:post) { Post.new(author: user, title: 'My first blogpost', text: 'Hello, today I will talk about my experience.', commentsCounter: 0, likesCounter: 0) }
  it 'fails because name should be present' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'fails because post counter should be an integer value' do
    user.postsCounter = 'hello'
    expect(user).to_not be_valid
  end

  it 'fails because posts count should be >= 0' do
    user.postsCounter = -1
    expect(user).to_not be_valid
  end

  it 'should return 1 since the user added 1 post' do
    post.update_posts_counter
    expect(user.postsCounter).to eq 1
  end
end
