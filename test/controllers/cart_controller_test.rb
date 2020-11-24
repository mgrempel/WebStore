require 'test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get cart_view_url
    assert_response :success
  end

end
