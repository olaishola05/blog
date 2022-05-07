class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :comments
  has_many :likes

  def update_counter
    user = User.find(user_id)
    post_counter = user.posts_counter
    post_counter ||= 0
    user.update(posts_counter: post_counter + 1)
  end

  def recent_comments(post_id)
    Comment.where(post_id: post_id).order(created_at: :desc).first(5)
  end
end
