require 'test_helper'

class Image2TestsControllerTest < ActionController::TestCase
  setup do
    @image2_test = image2_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image2_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image2_test" do
    assert_difference('Image2Test.count') do
      post :create, image2_test: { description: @image2_test.description, title: @image2_test.title }
    end

    assert_redirected_to image2_test_path(assigns(:image2_test))
  end

  test "should show image2_test" do
    get :show, id: @image2_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image2_test
    assert_response :success
  end

  test "should update image2_test" do
    patch :update, id: @image2_test, image2_test: { description: @image2_test.description, title: @image2_test.title }
    assert_redirected_to image2_test_path(assigns(:image2_test))
  end

  test "should destroy image2_test" do
    assert_difference('Image2Test.count', -1) do
      delete :destroy, id: @image2_test
    end

    assert_redirected_to image2_tests_path
  end
end
