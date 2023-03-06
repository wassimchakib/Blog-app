class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments
  after_save :update_posts_counter

  validates :title, :text, presence: true, length: { maximum: 250 }
  validates :commentsCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likesCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_posts_counter
    author.increment!(:postsCounter)
  end
end
