require "application_system_test_case"

class UserTest < ApplicationSystemTestCase
  def setup
    @user = users(:confirmed_user)
  end

  test "should register" do
    visit new_user_registration_path

    assert_difference("User.count") do
      fill_in "Email", with: "unique@example.com"
      fill_in "Password", with: "123456"
      fill_in "Password confirmation", with: "123456"

      click_button "Sign up"
    end
  end

  test "should sign in" do
    visit user_session_path

    fill_in "Email", with: @user.email
    fill_in "Password", with: "password"

    click_button "Log in"

    assert_selector "p", text: "Signed in successfully"
  end
end