class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def like_count
    post = Post.find(post_id)
    counts = post.likes_counter
    counts ||= 0
    post.update(likes_counter: counts + 1)
  end
end
