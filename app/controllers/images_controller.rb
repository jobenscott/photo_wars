class ImagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_image, only: [:show, :edit, :update, :destroy, :vote, :downvote]
  def index
    @images = Image.all.order(vote: :desc)
    if params[:categories]
      @images = Image.where(categories: params[:categories])
    else
      @animals_images = Image.all.where(categories: "Animals").order(vote: :desc)
      
      @people_images = Image.all.where(categories: "People").order(vote: :desc)
      @landscape_images = Image.all.where(categories: "Landscapes").order(vote: :desc)
      @funny_images = Image.all.where(categories: "Funny").order(vote: :desc)
      @abstract_images = Image.all.where(categories: "Abstract").order(vote: :desc)
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

  def vote
    @image = Image.find(params[:id])
    @image.vote += 1
    @image.save!
    redirect_to images_path
  end

  def downvote
    @image = Image.find(params[:id])
    @image.vote -= 1
    @image.save!
    redirect_to images_path
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to images_path
  end

  private

    def set_image
    @image = Image.find(params[:id])
  end

    def image_params
      params.require(:image).permit(:title, :url, :vote, :description, :categories, :user_id)
    end

end
