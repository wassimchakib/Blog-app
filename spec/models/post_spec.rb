require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.new(name: 'john', photo: 'link to photo', bio: 'dev', postsCounter: 0) }
  let(:post) do
    Post.new(author: user, title: 'web dev best practices', text: 'this is where the post text goes',
             commentsCounter: 0, likesCounter: 0)
  end
  let(:comment) { Comment.new(post:, author: user, text: 'test') }
  it 'fails because title should be present' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'fails because comment counter should be an integer value' do
    post.commentsCounter = 'hello'
    expect(post).to_not be_valid
  end

  it 'fails because comment counter should be >= 0' do
    post.commentsCounter = -1
    expect(post).to_not be_valid
  end

  it 'fails because like counter should be an integer' do
    post.likesCounter = 'hello'
    expect(post).to_not be_valid
  end

  it 'fails because like counter should be >= 0' do
    post.likesCounter = -1
    expect(post).to_not be_valid
  end

  it 'should return 1 since User added 1 comment to the post' do
    comment.update_comments_counter
    expect(post.commentsCounter).to eq 1
  end
end
