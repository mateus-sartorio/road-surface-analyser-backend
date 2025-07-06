require "application_system_test_case"

class GyroscopesTest < ApplicationSystemTestCase
  setup do
    @gyroscope = gyroscopes(:one)
  end

  test "visiting the index" do
    visit gyroscopes_url
    assert_selector "h1", text: "Gyroscopes"
  end

  test "should create gyroscope" do
    visit gyroscopes_url
    click_on "New gyroscope"

    fill_in "X", with: @gyroscope.x
    fill_in "Y", with: @gyroscope.y
    fill_in "Z", with: @gyroscope.z
    click_on "Create Gyroscope"

    assert_text "Gyroscope was successfully created"
    click_on "Back"
  end

  test "should update Gyroscope" do
    visit gyroscope_url(@gyroscope)
    click_on "Edit this gyroscope", match: :first

    fill_in "X", with: @gyroscope.x
    fill_in "Y", with: @gyroscope.y
    fill_in "Z", with: @gyroscope.z
    click_on "Update Gyroscope"

    assert_text "Gyroscope was successfully updated"
    click_on "Back"
  end

  test "should destroy Gyroscope" do
    visit gyroscope_url(@gyroscope)
    click_on "Destroy this gyroscope", match: :first

    assert_text "Gyroscope was successfully destroyed"
  end
end
