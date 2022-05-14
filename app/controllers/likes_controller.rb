class LikesController < ApplicationController
  load_and_authorize_resource
  skip_before_action :authenticate_request

  def new
    @like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    @like = Like.new(user_id: @user.id, post_id: @post.id)

    if @like.save
      @post = Post.find(params[:post_id])
      @like.like_count(@post.id)
      redirect_to user_post_path(user_id: @post.user_id, id: @post.id), notice: 'Successfully liked a post'
    else
      redirect_to user_post_path(user_id: @post.user_id, id: @post.id), notice: @like.errors.first.full_message.to_s
    end
  end
end
