class ImagesController < ApplicationController
  
  def index
    @images = Image.all.order(vote: :desc)
  end

  def profile
    @images = current_user.Image
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to image_path
    else
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])

    if @image.update(image_params)
      redirect_to image_path
    else
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to posts_path
  end

  private

    def image_params
      params.require(:image).permit(:title, :url, :vote, :description, :user_id)
    end
end
