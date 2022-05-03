class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def update_counter(post_id)
    counter = Post.where(user_id: post_id).count
    user = User.find(post_id)
    user.update(posts_counter: counter)
  end

  def recent_comments(post_id)
    post = Post.find(post_id)
    post.comments.order(created_at: :desc).limit(5)
  end
end
