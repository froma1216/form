require "test_helper"

class EFrontierControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get e_frontier_index_url
    assert_response :success
  end
end
