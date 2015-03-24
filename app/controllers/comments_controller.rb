class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_image

  def new
    @comment = @image.comments.build
  end

  def create
    @comment = @image.comments.build(comments_params)
    if @comment.save
      redirect_to @image
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    if @comment.user != current_user
      redirect_to @image, notice: "Nope"
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comments_params)
      redirect_to @image, notice: "comment updated"
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      redirect_to @image, notice: "comment deleted"
    else
      redirect_to @image, notice: "Nope"
    end
      render :back
    end 
  end

  # def edit
  #   @comment = Comment.edit(comments_params)
  # end

  # def update
  #   @comment = Comment.update(comments_params)
  #     redirect_to image_path(@image), :notice = "comment updated"
  # end

  def destroy
    @comment.destroy
    redirect_to :back, notice: "comment deleted"
  end


  private

  def set_image
    @image = Image.find(params[:image_id])
  end


  def comments_params
    params.require(:comment).permit(:body, :user_id, :image_id)
  end

end
