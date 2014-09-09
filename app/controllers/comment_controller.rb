class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    if comment.valid?
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
  end

private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
