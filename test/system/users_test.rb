require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    visit users_url
    click_on "New user"

    fill_in "First name", with: @user.first_name
    fill_in "Id", with: @user.id
    fill_in "Password", with: @user.password
    fill_in "Second name", with: @user.second_name
    fill_in "String", with: @user.string
    fill_in "User status", with: @user.user_status
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "Edit this user", match: :first

    fill_in "First name", with: @user.first_name
    fill_in "Id", with: @user.id
    fill_in "Password", with: @user.password
    fill_in "Second name", with: @user.second_name
    fill_in "String", with: @user.string
    fill_in "User status", with: @user.user_status
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit user_url(@user)
    click_on "Destroy this user", match: :first

    assert_text "User was successfully destroyed"
  end
end
