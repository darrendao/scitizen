class ExploreController < ApplicationController
  before_filter :notify_new_achievements
  def index
    # Get what's new
    @new_images = Image.limit(10).order('id desc')

    # TODO: Get what's hot
    # @hot_images 

    # Get random
    @random_images = Image.offset(rand(Image.count)).limit(10)
  end

  def show
    @image = Image.find(params[:id])
  end

  def random
    @random_image =  Image.offset(rand(Image.count)).first
  end

  def gallery
    @images = Image.paginate(page: params[:page], per_page: 15).order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end
end
