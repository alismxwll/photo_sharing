class TagsController < ApplicationController

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)
    if @tag.valid?
      redirect_to post_path(@post)
    else
      notice: "Something went terribly wrong... Try again..."
      redirect_to post_path(@post)
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to post_path(@post)
  end

private
  def tag_params
    params.require(:tag).permit(:user_email, :post_id)
  end
end
