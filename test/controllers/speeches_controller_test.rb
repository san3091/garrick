require 'test_helper'

class SpeechesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get speeches_show_url
    assert_response :success
  end

end
