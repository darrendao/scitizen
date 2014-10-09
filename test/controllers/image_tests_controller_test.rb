require 'test_helper'

class ImageTestsControllerTest < ActionController::TestCase
  setup do
    @image_test = image_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image_test" do
    assert_difference('ImageTest.count') do
      post :create, image_test: { description: @image_test.description, title: @image_test.title }
    end

    assert_redirected_to image_test_path(assigns(:image_test))
  end

  test "should show image_test" do
    get :show, id: @image_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image_test
    assert_response :success
  end

  test "should update image_test" do
    patch :update, id: @image_test, image_test: { description: @image_test.description, title: @image_test.title }
    assert_redirected_to image_test_path(assigns(:image_test))
  end

  test "should destroy image_test" do
    assert_difference('ImageTest.count', -1) do
      delete :destroy, id: @image_test
    end

    assert_redirected_to image_tests_path
  end
end
