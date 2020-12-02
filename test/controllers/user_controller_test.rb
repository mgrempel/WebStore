require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get address" do
    get user_address_url
    assert_response :success
  end

end
