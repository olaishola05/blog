class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  skip_before_action :authenticate_request

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
