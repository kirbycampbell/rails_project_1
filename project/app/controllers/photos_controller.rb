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
      redirect_to @topic
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:photo_id])
    raise params.inspect
  end

  def destroy
  #  raise photo.inspect
  #  photo = Photo.find(:photo_id)
  #
  #  photo.destroy
  #  flash[:success] = "Photo Deleted"
  #  redirect_to topic_path

    @photo = Photo.find(params[:id])
    @topic = @photo.topic
    if @photo.destroy
      redirect_to topic_path(@topic)
      flash[:success] = "Photo Deleted"
    else
      redirect_to topic_path(@topic)
      flash[:success] = "Unable to Delete"
    end
  end


  private

  def photo_params
    params.require(:photo).permit(:image_url)
  end
end
