require 'test_helper'

class AssociationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get associations_show_url
    assert_response :success
  end

end
