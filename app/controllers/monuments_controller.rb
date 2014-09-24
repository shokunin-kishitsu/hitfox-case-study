class MonumentsController < ApplicationController

  before_action :set_collection_and_monument, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit]

  def index
    @collection = Collection.find(params[:collection_id])
    @monuments = @collection.monuments
  end

  def edit
    @path = monument_path(@monument)
  end

  def new
    @monument = Monument.new
    @collection = Collection.find(params[:collection_id])
    @path = collection_monuments_path(@collection, @monument)
  end

  def create
    @collection = Collection.find(params[:collection_id])
    @monument = Monument.new(monument_params)
    @monument.collection = @collection

    if @monument.save
      redirect_to collections_url, notice: 'Monument was successfully created.'
    else
      render :new
    end
  end

  def update
    if @monument.update(monument_params)
      redirect_to collections_url, notice: 'Monument was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @monument.destroy
    redirect_to collections_url, notice: 'Monument was successfully destroyed.'
  end

  private
    def set_collection_and_monument
      @monument = Monument.find(params[:id])
      @collection = @monument.collection
    end

    def set_categories
      @categories = current_user.categories.map {|cat| [cat.name, cat.id] }
      @categories = [['---', '']] + @categories
    end

    def monument_params
      params.require(:monument).permit(:name, :description, :category_id)
    end
end
