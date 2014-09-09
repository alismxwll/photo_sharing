class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.all
  end

  def create
    @user = User.where(:user_id => current_user.id)
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    if @comment.valid?
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
    end
  end

private
  def comment_params
    params.require(:comment).permit(:comment, :user_id).merge(:user_id => current_user.id)
  end
end
