class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def comment_counters
    post = Post.find(post_id)
    post_comments = post.comments_counter
    post_comments ||= 0
    post.update(comments_counter: post_comments + 1)
  end
end
