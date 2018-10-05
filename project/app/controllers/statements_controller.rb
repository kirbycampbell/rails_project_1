class StatementsController < ApplicationController

  def index
    @statements = Statement.all
  end

  def new
    @statement = Statement.new
    #@topic = Topic.find(params[:id])
  end

  def create

    @topic = Topic.find_by(params[:id])
    @statement = Statement.new(statement_params)
    @statement.topic = @topic
    if @statement.save
      redirect_to topic_path(@topic)
    else
      render :new
    end
  end

  def show
    @statement = Statement.find(params[:statement_id])
  end

  private

  def statement_params
    params.require(:statement).permit(:content)
  end
end
