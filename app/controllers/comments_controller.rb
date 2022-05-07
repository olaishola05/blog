class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    # @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(
      text: comment_params[:text],
      user_id: params[:user_id],
      post_id: @post.id
    )

    if @comment.save
      redirect_to user_post_path(user_id: @post.user_id, id: @post.id), success: 'Successfully add a comment'
    else
      flash.now[:error] = 'Comment was not added'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
