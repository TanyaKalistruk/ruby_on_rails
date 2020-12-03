require 'test_helper'

class UserItemControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_item_index_url
    assert_response :success
  end

end
