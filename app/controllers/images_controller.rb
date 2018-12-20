# frozen_string_literal: true

class ImagesController < ApplicationController
  def new
    @images = Image.all
  end

  def index
    @images = image_array_genrator(Image.random)
    @plays = Play.all
  end

  def create
    begin
      Image.transaction do
        params[:images][:files].each do |file|
          Image.create!(file: file)
        end
      end
      flash[:success] = "Images are uploaded successfully!"
      redirect_to images_path
    rescue
      flash[:danger] = "please upload valid images!"
      redirect_to new_image_path
    end
  end

  private

  def images_params
    params.require(:images).permit(files: [])
  end

  def image_array_genrator(images)
    return [] if images.blank?
    urls = images.map { |img| Rails.application.routes.url_helpers.url_for(img.file) }
    urls += urls while urls.count < 10
    urls.first(10)
  end
end
