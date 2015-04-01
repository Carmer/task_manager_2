require_relative '../test_helper'

class FrontPageTest < FeatureTest
  def test_user_sees_welcome_message
    visit '/'
    save_and_open_page
    assert page.has_content?("Welcome to your Task Manager")
  end
end
