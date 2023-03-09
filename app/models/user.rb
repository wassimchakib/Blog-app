class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id

  validates :name, :bio, :photo, presence: true
  validates :postsCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
