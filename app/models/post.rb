class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def update_counter
    @user = User.find(id)
    @post_counters = @user.posts.count
  end

  def recent_comments
    @post = Post.find(params[:id])
    @recent_comments = @post.comments.all.order(created_at: :desc).limit(5)
  end
end
