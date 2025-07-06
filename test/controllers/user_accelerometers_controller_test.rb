require "test_helper"

class UserAccelerometersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_accelerometer = user_accelerometers(:one)
  end

  test "should get index" do
    get user_accelerometers_url
    assert_response :success
  end

  test "should get new" do
    get new_user_accelerometer_url
    assert_response :success
  end

  test "should create user_accelerometer" do
    assert_difference("UserAccelerometer.count") do
      post user_accelerometers_url, params: { user_accelerometer: { x: @user_accelerometer.x, y: @user_accelerometer.y, z: @user_accelerometer.z } }
    end

    assert_redirected_to user_accelerometer_url(UserAccelerometer.last)
  end

  test "should show user_accelerometer" do
    get user_accelerometer_url(@user_accelerometer)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_accelerometer_url(@user_accelerometer)
    assert_response :success
  end

  test "should update user_accelerometer" do
    patch user_accelerometer_url(@user_accelerometer), params: { user_accelerometer: { x: @user_accelerometer.x, y: @user_accelerometer.y, z: @user_accelerometer.z } }
    assert_redirected_to user_accelerometer_url(@user_accelerometer)
  end

  test "should destroy user_accelerometer" do
    assert_difference("UserAccelerometer.count", -1) do
      delete user_accelerometer_url(@user_accelerometer)
    end

    assert_redirected_to user_accelerometers_url
  end
end
