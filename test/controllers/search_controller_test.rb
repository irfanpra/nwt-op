require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get users" do
    get :users
    assert_response :success
  end

  test "should get ads" do
    get :ads
    assert_response :success
  end

end
