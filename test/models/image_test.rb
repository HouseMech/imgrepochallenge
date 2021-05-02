require "test_helper"

class ImageTest < ActiveSupport::TestCase
  test "should not save image without title" do
    image = Image.new
    #Need to find a way to add a temporary image to test case
    assert_not image.save, "Saved the image without a title"
  end

  test "should not save image without attached photo" do
    image = Image.new
    image.title = "Test No Photo"
    assert_not image.save, "Saved the image without an attached photo"
  end

end
