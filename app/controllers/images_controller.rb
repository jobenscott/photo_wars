class ImagesController < ApplicationController
  
  def index
    @images = Image.all.order(vote: :desc)
    if params[:categories]
      @images = Image.where(categories: params[:categories])
    else
      @animals_images = Image.all.where(categories: "Animals")
      @people_images = Image.all.where(categories: "People")
      @landscape_images = Image.all.where(categories: "Landscapes")
      @funny_images = Image.all.where(categories: "Funny")
      @abstract_images = Image.all.where(categories: "Abstract")
    end
  end

  def profile
    @images = current_user.Image
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @categories = ["Animals", "People", "Landscapes", "Funny", "Abstract"]
    @image = Image.new
  end

  def create
    @categories = ["Animals", "People", "Landscapes", "Funny", "Abstract"]
    @image = Image.new(image_params)

    if @image.save
      redirect_to image_path(@image)
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
    redirect_to images_path
  end

  private

    def image_params
      params.require(:image).permit(:title, :url, :vote, :description, :categories, :user_id)
    end

end
