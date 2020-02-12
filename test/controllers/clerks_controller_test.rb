require 'test_helper'

class ClerksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get clerks_new_url
    assert_response :success
  end

  test "should get create" do
    get clerks_create_url
    assert_response :success
  end

end
