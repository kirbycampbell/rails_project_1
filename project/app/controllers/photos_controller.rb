class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
    #@topic = Topic.find(params[:id])
  end

  def create

    @topic = Topic.find_by(params[:id])
    @photo = Photo.new(photo_params)
    @photo.topic = @topic
    if @photo.save
      redirect_to topic_path(@topic)
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:photo_id])
  end

  def destroy
    raise params.inspect
    Photo.find(params[:photo_id]).destroy
    flash[:success] = "Photo Deleted"
    redirect_to topic_path
  end

  private

  def photo_params
    params.require(:photo).permit(:image_url)
  end
end
