class StatementsController < ApplicationController

  def index
    @statements = Statement.all
  end

  def new
    @statement = Statement.new
    @topic = Topic.find(params[:topic_id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @statement = Statement.new(statement_params)
    @statement.topic = @topic
    if @statement.save
      flash[:notice] = "Statement successfully added to #{@topic.title.upcase}"
      redirect_to @topic
    else
      render :new
    end
  end

  def show
    @statement = Statement.find(params[:statement_id])
  end

  def destroy
    @statement = Statement.find(params[:id])
    @topic = @statement.topic
    if @statement.destroy
      flash[:notice] = "Statement Deleted"
      redirect_to topic_path(@topic)
    else
      flash[:notice] = "Unable to Delete"
      redirect_to topic_path(@topic)
    end
  end

  private

  def statement_params
    params.require(:statement).permit(:content)
  end
end
