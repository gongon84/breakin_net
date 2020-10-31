require 'test_helper'

class User2sControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user2s_index_url
    assert_response :success
  end

end
