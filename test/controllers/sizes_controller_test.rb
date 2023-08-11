require 'test_helper'

class SizesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sizes_index_url
    assert_response :success
  end

  test "should get new" do
    get sizes_new_url
    assert_response :success
  end

  test "should get edit" do
    get sizes_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get sizes_destroy_url
    assert_response :success
  end

end
