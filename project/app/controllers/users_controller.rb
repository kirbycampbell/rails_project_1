class UsersController < ApplicationController
  def welcome
    if session[:name]
      render 'welcome'
    else
      redirect_to :new
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:name)
  end

end
