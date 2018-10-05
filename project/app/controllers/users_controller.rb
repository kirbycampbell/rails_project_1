class UsersController < ApplicationController
  def welcome
    if session[:id]
      render 'welcome'
    else
      redirect_to new_user_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Twumblstergram!"
      session[:id] = params[:id]
      redirect_to @user
    else
      render :new
    end
  end


  def show
    @user = User.find(params[:id])
  end

  def destroy
    session.delete :name
    redirect_to controller: 'application', action: 'start'
  end


  private

  def user_params
    params.require(:user).permit(:name)
  end

end
