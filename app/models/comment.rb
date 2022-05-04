class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def comment_counters
    post_comments = Post.find(post_id).comments_counter
    post_comments ||= 0
    post.update(comments_counter: post_comments + 1)
  end
end
