class ImagesController < ApplicationController
  def index
  end

  def profile
  end

  def show
  end



  private

  def image_params
    params.require(:comment).permit(:body, :image_id)
  end
  
end
