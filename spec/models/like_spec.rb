require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) do
    User.new(name: 'Tom', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
             bio: 'Teacher from Mexico.', postsCounter: 0)
  end
  let(:post) do
    Post.new(author: user, title: 'Hello', text: 'This is my first post', commentsCounter: 0, likesCounter: 5)
  end

  let(:like) { Like.new(post:, author: user) }

  it 'should increment likes counter by 1' do
    like.update_likes_counter
    expect(post.likesCounter).to eq 6
  end
end
