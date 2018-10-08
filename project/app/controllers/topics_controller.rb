class TopicsController < ApplicationController
  before_action :require_login
  before_action :only_see_own_page, only: [:show]

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    user = current_user
    @topic.user = user
    if @topic.save
      redirect_to @topic
    else
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @photos = @topic.photos
    @statements = @topic.statements
  end

  def show_all
    @topics = Topic.all.order('created_at DESC')
    @statements = Statement.all.order('created_at DESC')
    @photos = Photo.all.order('created_at DESC')

  end


  private

  def topic_params
    params.require(:topic).permit(:title, :user)
  end

  def only_see_own_page
    @topic = Topic.find(params[:id])
    @user = @topic.user

    if current_user != @user
      redirect_to root_path, notice: "Sorry, but you are only allowed to view your own profile page."
    end
  end
end
