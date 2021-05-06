class ImagesController < ApplicationController
  def index
    @q = Image.ransack(params[:q])
    @images = Image.all
  end

  def search
      @q = Image.ransack(params[:q])
      @results = @q.result()
  end

  def new
    @image = Image.new
  end

  def show
    @image = Image.find(params[:id])
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to @image, notice: "Image successfully created."
    else
      render 'new'
    end
  end

  private
    def image_params
      params.require(:image).permit(:title, :photo, :tag_list => [])
    end
end
