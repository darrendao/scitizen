class ImageTestsController < ApplicationController
  before_action :set_image_test, only: [:show, :edit, :update, :destroy]

  # GET /image_tests
  # GET /image_tests.json
  def index
    @image_tests = ImageTest.all
  end

  # GET /image_tests/1
  # GET /image_tests/1.json
  def show
  end

  # GET /image_tests/new
  def new
    @image_test = ImageTest.new
  end

  # GET /image_tests/1/edit
  def edit
  end

  # POST /image_tests
  # POST /image_tests.json
  def create
    @image_test = ImageTest.new(image_test_params)

    respond_to do |format|
      if @image_test.save
        format.html { redirect_to @image_test, notice: 'Image test was successfully created.' }
        format.json { render :show, status: :created, location: @image_test }
      else
        format.html { render :new }
        format.json { render json: @image_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_tests/1
  # PATCH/PUT /image_tests/1.json
  def update
    respond_to do |format|
      if @image_test.update(image_test_params)
        format.html { redirect_to @image_test, notice: 'Image test was successfully updated.' }
        format.json { render :show, status: :ok, location: @image_test }
      else
        format.html { render :edit }
        format.json { render json: @image_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_tests/1
  # DELETE /image_tests/1.json
  def destroy
    @image_test.destroy
    respond_to do |format|
      format.html { redirect_to image_tests_url, notice: 'Image test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_test
      @image_test = ImageTest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_test_params
      params.require(:image_test).permit(:title, :description)
    end
end
