class UsersController < ApplicationController

  def index
    @users = User.all
    if params[:search]
      # binding.pry
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order('created_at DESC')
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up!"
      redirect_to root_path
    else
      render "new"
    end
  end


private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :search)
  end
end


