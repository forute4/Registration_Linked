require "test_helper"

class Admin::TargetsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_targets_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_targets_edit_url
    assert_response :success
  end

  test "should get index" do
    get admin_targets_index_url
    assert_response :success
  end
end
