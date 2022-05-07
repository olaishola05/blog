class Post < ApplicationRecord

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
    # post = Post.find(params[:post_id])
    # post.comments.order(created_at: :desc).limit(5)
    Comment.where(post_id: post_id).order(created_at: :desc).first(5)
  end

end
