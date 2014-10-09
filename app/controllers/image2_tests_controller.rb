class Image2TestsController < ApplicationController
  before_action :set_image2_test, only: [:show, :edit, :update, :destroy]

  # GET /image2_tests
  # GET /image2_tests.json
  def index
    @image2_tests = Image2Test.all
  end

  # GET /image2_tests/1
  # GET /image2_tests/1.json
  def show
  end

  # GET /image2_tests/new
  def new
    @image2_test = Image2Test.new
  end

  # GET /image2_tests/1/edit
  def edit
  end

  # POST /image2_tests
  # POST /image2_tests.json
  def create
    @image2_test = Image2Test.new(image2_test_params)

    respond_to do |format|
      if @image2_test.save
        format.html { redirect_to @image2_test, notice: 'Image2 test was successfully created.' }
        format.json { render :show, status: :created, location: @image2_test }
      else
        format.html { render :new }
        format.json { render json: @image2_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image2_tests/1
  # PATCH/PUT /image2_tests/1.json
  def update
    respond_to do |format|
      if @image2_test.update(image2_test_params)
        format.html { redirect_to @image2_test, notice: 'Image2 test was successfully updated.' }
        format.json { render :show, status: :ok, location: @image2_test }
      else
        format.html { render :edit }
        format.json { render json: @image2_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image2_tests/1
  # DELETE /image2_tests/1.json
  def destroy
    @image2_test.destroy
    respond_to do |format|
      format.html { redirect_to image2_tests_url, notice: 'Image2 test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image2_test
      @image2_test = Image2Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image2_test_params
      params.require(:image2_test).permit(:title, :description)
    end
end
