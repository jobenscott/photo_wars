class CommentsController < ApplicationController

  before_action :find_image


  def create
    @comment = @image.comments.new(comments_params)
    if @comment.save
      redirect_to image_path(@image)
    else
      render :back
  end

  def edit
    @comment = Comment.edit(comments_params)
  end

  def update
    @comment = Comment.update(comments_params)
      redirect_to image_path(@image), :notice = "comment updated"
  end

  def destroy
    @comment.destroy
    redirect_to image_path(@image), :notice = "comment deleted"
  end


  private

  def find_image
    @image = Image.find(params[:image_id])
  end


  def comments_params
    params.require(:comment).permit(:body, :image_id)
    
  end

end
