class UsersController < ApplicationController
  before_action :only_see_own_page, only: [:show]

  def welcome
    if session[:id]
      render 'welcome'
    else
      redirect_to controller: 'application', action: 'start'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Twumblstergram!"
      redirect_to @user
    else
      render :new
    end
  end


  def show
    @user = User.find(params[:id])
    @topics = @user.topics
  end

  def destroy
    session.delete :name
    redirect_to controller: 'application', action: 'start'
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def only_see_own_page
    @user = User.find(params[:id])

    if current_user != @user
      redirect_to root_path, notice: "Sorry, but you are only allowed to view your own profile page."
    end
  end

end
