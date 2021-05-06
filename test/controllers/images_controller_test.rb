require "test_helper"

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image = images(:one)
  end

  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should get new" do
    get new_image_url
    assert_response :success
  end

  test "should create image" do
    assert_difference('Image.count') do
       post images_url, params: { image: { title: @image.title, photo:  fixture_file_upload("coconut.jpg") } }
    end
    assert_redirected_to image_url(Image.last)
  end
end
