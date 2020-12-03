require 'test_helper'

class ProstorControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get prostor_new_url
    assert_response :success
  end

  test "should get create" do
    get prostor_create_url
    assert_response :success
  end

  test "should get edit" do
    get prostor_edit_url
    assert_response :success
  end

  test "should get update" do
    get prostor_update_url
    assert_response :success
  end

  test "should get destroy" do
    get prostor_destroy_url
    assert_response :success
  end

  test "should get index" do
    get prostor_index_url
    assert_response :success
  end

end
