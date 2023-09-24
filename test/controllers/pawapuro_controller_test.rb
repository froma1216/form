require "test_helper"

class PawapuroControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pawapuro_index_url
    assert_response :success
  end
end
