require 'test_helper'

class Users::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get users_homes_about_url
    assert_response :success
  end

end
