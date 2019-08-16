require 'test_helper'

class MemosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get memos_new_url
    assert_response :success
  end

end
