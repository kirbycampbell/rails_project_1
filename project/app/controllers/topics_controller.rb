class TopicsController < ApplicationController
  before_action :require_login

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

  private

  def topic_params
    params.require(:topic).permit(:title, :user)
  end
end
