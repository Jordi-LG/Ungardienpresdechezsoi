require 'test_helper'

class StaticpagesControllerTest < ActionDispatch::IntegrationTest
  test "should get team" do
    get staticpages_team_url
    assert_response :success
  end

  test "should get contact" do
    get staticpages_contact_url
    assert_response :success
  end

end
