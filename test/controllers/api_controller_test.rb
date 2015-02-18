require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get campi" do
    get :campi
    assert_response :success
  end

  test "should get calendario" do
    get :calendario
    assert_response :success
  end

end
