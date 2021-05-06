require "test_helper"

class ImageTest < ActionDispatch::IntegrationTest
  test "should not save image without title" do
    image = Image.new
    image.photo = fixture_file_upload('coconut.jpg')
    assert_not image.save, "Saved the image without a title"
  end

  test "should not save image without attached photo" do
    image = Image.new
    image.title = "Test No Photo"
    assert_not image.save, "Saved the image without an attached photo"
  end

end
