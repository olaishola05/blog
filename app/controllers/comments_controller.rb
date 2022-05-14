class CommentsController < ApplicationController
  skip_before_action :authenticate_request
  before_action :authenticate_request, only: [:add_comment]
  protect_from_forgery with: :null_session, only: [:add_comment]
  # load_and_authorize_resource param_method: :comment_params

  def new
    @comment = Comment.new
  end

  # def create
  #   @post = Post.find(params[:post_id])
  #   @comment = current_user.comments.new(
  #     text: comment_params[:text],
  #     user_id: params[:user_id],
  #     post_id: @post.id
  #   )

  #   if @comment.save
  #     redirect_to user_post_path(user_id: @post.user_id, id: @post.id), success: 'Successfully add a comment'
  #   else
  #     flash.now[:error] = 'Comment was not added'
  #     render :new
  #   end
  # end

  # def destroy
  #   flash[:notice] = if @comment.destroy
  #                      'Comment deleted successfully'
  #                    else
  #                      'Comment was not deleted successfully'
  #                    end
  #   redirect_to user_post_path(params[:user_id], params[:post_id])
  # end

  def comments
    post = Post.find(params[:id])

    respond_to do |format|
      format.json { render json: post.comments }
    end
  end

  def add_comment
    comment = Comment.new(author: @curr_user, post_id: params[:post_id], text: params[:text])

    respond_to do |format|
      if comment.save
        format.json { render json: comment }
      else
        format.json { render json: { success: false, message: comment.errors.full_messages } }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
