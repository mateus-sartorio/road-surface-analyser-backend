require "application_system_test_case"

class UserAccelerometersTest < ApplicationSystemTestCase
  setup do
    @user_accelerometer = user_accelerometers(:one)
  end

  test "visiting the index" do
    visit user_accelerometers_url
    assert_selector "h1", text: "User accelerometers"
  end

  test "should create user accelerometer" do
    visit user_accelerometers_url
    click_on "New user accelerometer"

    fill_in "X", with: @user_accelerometer.x
    fill_in "Y", with: @user_accelerometer.y
    fill_in "Z", with: @user_accelerometer.z
    click_on "Create User accelerometer"

    assert_text "User accelerometer was successfully created"
    click_on "Back"
  end

  test "should update User accelerometer" do
    visit user_accelerometer_url(@user_accelerometer)
    click_on "Edit this user accelerometer", match: :first

    fill_in "X", with: @user_accelerometer.x
    fill_in "Y", with: @user_accelerometer.y
    fill_in "Z", with: @user_accelerometer.z
    click_on "Update User accelerometer"

    assert_text "User accelerometer was successfully updated"
    click_on "Back"
  end

  test "should destroy User accelerometer" do
    visit user_accelerometer_url(@user_accelerometer)
    click_on "Destroy this user accelerometer", match: :first

    assert_text "User accelerometer was successfully destroyed"
  end
end
