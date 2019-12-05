require 'test_helper'

class PetsittersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get petsitters_index_url
    assert_response :success
  end

  test "should get show" do
    get petsitters_show_url
    assert_response :success
  end

end
