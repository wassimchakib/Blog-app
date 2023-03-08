require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) do
    User.new(name: 'Tom', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
             bio: 'Teacher from Mexico.', postsCounter: 0)
  end
  let(:post) do
    Post.new(author: user, title: 'Hello', text: 'This is my first post', commentsCounter: 0, likesCounter: 0)
  end

  let(:comment) { Comment.new(post:, author: user, text: 'this is where the comment text goes') }

  it 'should contain a text' do
    expect(comment.text).to eq 'this is where the comment text goes'
  end
end
