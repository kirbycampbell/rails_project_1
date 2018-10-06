class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
    @topic = Topic.find(params[:topic_id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @photo = Photo.new(photo_params)
    @photo.topic = @topic
    if @photo.save
      flash[:notice] = "Photo successfully added to #{@topic.title.upcase}"
      redirect_to @topic
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:photo_id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    @topic = @photo.topic
    if @photo.destroy
      flash[:notice] = "Photo Deleted"
      redirect_to topic_path(@topic)
    else
      flash[:notice] = "Unable to Delete"
      redirect_to topic_path(@topic)
    end
  end


  private

  def photo_params
    params.require(:photo).permit(:image_url)
  end
end
