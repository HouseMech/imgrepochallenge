class ImagesController < ApplicationController
  def index
    @q = Image.ransack(params[:q])
    @images = Image.all
  end

  def search
      if params[:similar]
        @image = Image.find(params[:id])
        image_ids = []
        Image.where.not(["id = ?", @image.id]).each do |image|
          if @image.compare_to_image(image)
            image_ids.push(image.id)
          end
        end
        @results = Image.where(id: image_ids)
      else
        @q = Image.ransack(params[:q])
        @results = @q.result(distinct: true)
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
