require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_in" do
    get login_sign_in_url
    assert_response :success
  end

end
