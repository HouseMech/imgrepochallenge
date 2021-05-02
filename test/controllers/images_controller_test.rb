require "test_helper"

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    assert_routing "/images", {controller: "images", action: "index"}
  end
end
