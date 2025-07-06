require "test_helper"

class AccelerometersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accelerometer = accelerometers(:one)
  end

  test "should get index" do
    get accelerometers_url
    assert_response :success
  end

  test "should get new" do
    get new_accelerometer_url
    assert_response :success
  end

  test "should create accelerometer" do
    assert_difference("Accelerometer.count") do
      post accelerometers_url, params: { accelerometer: { x: @accelerometer.x, y: @accelerometer.y, z: @accelerometer.z } }
    end

    assert_redirected_to accelerometer_url(Accelerometer.last)
  end

  test "should show accelerometer" do
    get accelerometer_url(@accelerometer)
    assert_response :success
  end

  test "should get edit" do
    get edit_accelerometer_url(@accelerometer)
    assert_response :success
  end

  test "should update accelerometer" do
    patch accelerometer_url(@accelerometer), params: { accelerometer: { x: @accelerometer.x, y: @accelerometer.y, z: @accelerometer.z } }
    assert_redirected_to accelerometer_url(@accelerometer)
  end

  test "should destroy accelerometer" do
    assert_difference("Accelerometer.count", -1) do
      delete accelerometer_url(@accelerometer)
    end

    assert_redirected_to accelerometers_url
  end
end
