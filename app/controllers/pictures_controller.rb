class PicturesController < ApplicationController

  before_action :set_monument_and_picture, only: [:show, :edit, :update, :destroy]

  def edit
    @path = picture_path(@picture)
  end

  def new
    @picture = Picture.new
    @monument = Monument.find(params[:monument_id])
    @path = monument_pictures_path(@monument, @picture)
  end

  def create
    @monument = Monument.find(params[:monument_id])
    @picture = Picture.new(picture_params)
    @picture.monument = @monument

    if @picture.save
      redirect_to collections_url, notice: 'Picture was successfully created.'
    else
      render :new
    end
  end

  def update
    if @picture.update(picture_params)
      redirect_to collections_url, notice: 'Picture was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    redirect_to collections_url, notice: 'Picture was successfully destroyed.'
  end

  private
    def set_monument_and_picture
      @picture = Picture.find(params[:id])
      @monument = @picture.monument
    end

    def picture_params
      params.require(:picture).permit(:name, :description, :image)
    end

end
