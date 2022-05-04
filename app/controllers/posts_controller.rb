class PostsController < ApplicationController
  def index
    @posts = Post.find_by(user_id: params[:id])
    # @posts.all
  end

  def show; end
end
