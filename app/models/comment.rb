class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments
    @post = Post.find(id)
    @updates_counter = @post.comments.count
  end
end
