class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new
    @post = Post.new
  end

  def create
    # @post = current_user.posts.new(post_params)
    @post = Post.new(
      title: post_params[:title],
      text: post_params[:text],
      comments_counter: 0,
      likes_counter: 0,
      user_id: params[:user_id]
    )
    if @post.save
      @post.update_counter(current_user.id)
      redirect_to user_posts_path(current_user)
    else
      render :new, alert: 'An error has occurred while creating the post'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
