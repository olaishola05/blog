class LikesController < ApplicationController
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
      redirect_to user_post_path(user_id: @post.user_id, id: @post.id), success: 'Successfully liked a post'
    else
      redirect_to user_post_path(user_id: @post.user_id, id: @post.id),
                  flash.now[:error] = 'An error occurr while trying to like this post'
    end
  end
end
