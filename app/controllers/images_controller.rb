class ImagesController < ApplicationController
  def index
    @results = Image.all.page params[:page]
  end

  def search
    if params[:tag]
      @results = Image.tagged_with(params[:tag]).page params[:page]
    else
      @results = @q.result(distinct: true).page params[:page]
    end

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
