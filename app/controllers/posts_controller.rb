class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  load_and_authorize_resource param_method: :post_params

  def index
    @posts = Post.where(user_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      title: post_params[:title],
      text: post_params[:text],
      comments_counter: 0,
      likes_counter: 0,
      user_id: params[:user_id]
    )
    if @post.save
      @post.update_counter
      redirect_to user_posts_path(current_user), notice: 'Successfully created a post'
    else
      flash[:notice] = @post.errors.first.full_message.to_s
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments, :likes).find(params[:id])
  end



  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
