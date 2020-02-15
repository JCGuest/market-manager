require 'test_helper'

class PatronControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get patron_show_url
    assert_response :success
  end

  test "should get destroy" do
    get patron_destroy_url
    assert_response :success
  end

end
