require 'test_helper'

class PetsittingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get petsittings_new_url
    assert_response :success
  end

  test "should get create" do
    get petsittings_create_url
    assert_response :success
  end

end
