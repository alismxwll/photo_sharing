class PostsController < ApplicationController

  before_filter :authorize, only:[:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.valid?
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @tags = @post.tags
    @comments = @post.comments
    @comment = Comment.new
    @tag = Tag.new
    render 'show'
  end

  private
  def post_params
    params.require(:post).permit(:image, :description)
  end
end
