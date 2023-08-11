require 'test_helper'

class QuantitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quantities_index_url
    assert_response :success
  end

  test "should get new" do
    get quantities_new_url
    assert_response :success
  end

  test "should get edit" do
    get quantities_edit_url
    assert_response :success
  end

end
