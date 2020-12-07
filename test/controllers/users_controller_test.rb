require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get orders" do
    get users_orders_url
    assert_response :success
  end

end
