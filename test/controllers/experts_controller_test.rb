require "test_helper"

class ExpertsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get experts_index_url
    assert_response :success
  end

  test "should get show" do
    get experts_show_url
    assert_response :success
  end
end
