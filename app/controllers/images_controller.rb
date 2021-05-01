class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
  end

  def create
    
  end

  private
    def image_params
      params.require(:image).permit(:title, :photo)
    end
end
