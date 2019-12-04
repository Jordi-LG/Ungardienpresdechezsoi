require 'test_helper'

class PetownersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get petowners_index_url
    assert_response :success
  end

  test "should get show" do
    get petowners_show_url
    assert_response :success
  end

end
