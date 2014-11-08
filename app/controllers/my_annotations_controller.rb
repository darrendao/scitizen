class MyAnnotationsController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def index
    @images = {}
    current_user.image_annotations.each do |anno|
      @images[anno.image.url] ||= {}
      @images[anno.image.url][:image] ||= anno.image
      @images[anno.image.url][:annotation_text] ||= []
      @images[anno.image.url][:annotation_text] << anno.text
    end       
  end

  def show
  end

  def list_anno
    annos = []
    image_annotations = ImageAnnotation.where(:user_id => current_user.id, :image_id => params['image_id']).all 
    image_annotations.each do |anno|
      annos << {src: anno.src,
                text: anno.text,
                shapes: JSON.parse(anno.shapes)}
    end
    render json: annos
  end

  private
  def set_image
    @image = Image.find(params[:id])
  end
end
