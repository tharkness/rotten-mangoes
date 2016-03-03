require 'test_helper'

class RakeControllerTest < ActionController::TestCase
  test "should get routes" do
    get :routes
    assert_response :success
  end

end
