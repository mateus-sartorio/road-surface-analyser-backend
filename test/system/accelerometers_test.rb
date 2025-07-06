require "application_system_test_case"

class AccelerometersTest < ApplicationSystemTestCase
  setup do
    @accelerometer = accelerometers(:one)
  end

  test "visiting the index" do
    visit accelerometers_url
    assert_selector "h1", text: "Accelerometers"
  end

  test "should create accelerometer" do
    visit accelerometers_url
    click_on "New accelerometer"

    fill_in "X", with: @accelerometer.x
    fill_in "Y", with: @accelerometer.y
    fill_in "Z", with: @accelerometer.z
    click_on "Create Accelerometer"

    assert_text "Accelerometer was successfully created"
    click_on "Back"
  end

  test "should update Accelerometer" do
    visit accelerometer_url(@accelerometer)
    click_on "Edit this accelerometer", match: :first

    fill_in "X", with: @accelerometer.x
    fill_in "Y", with: @accelerometer.y
    fill_in "Z", with: @accelerometer.z
    click_on "Update Accelerometer"

    assert_text "Accelerometer was successfully updated"
    click_on "Back"
  end

  test "should destroy Accelerometer" do
    visit accelerometer_url(@accelerometer)
    click_on "Destroy this accelerometer", match: :first

    assert_text "Accelerometer was successfully destroyed"
  end
end
