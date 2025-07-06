require "test_helper"

class GyroscopesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gyroscope = gyroscopes(:one)
  end

  test "should get index" do
    get gyroscopes_url
    assert_response :success
  end

  test "should get new" do
    get new_gyroscope_url
    assert_response :success
  end

  test "should create gyroscope" do
    assert_difference("Gyroscope.count") do
      post gyroscopes_url, params: { gyroscope: { x: @gyroscope.x, y: @gyroscope.y, z: @gyroscope.z } }
    end

    assert_redirected_to gyroscope_url(Gyroscope.last)
  end

  test "should show gyroscope" do
    get gyroscope_url(@gyroscope)
    assert_response :success
  end

  test "should get edit" do
    get edit_gyroscope_url(@gyroscope)
    assert_response :success
  end

  test "should update gyroscope" do
    patch gyroscope_url(@gyroscope), params: { gyroscope: { x: @gyroscope.x, y: @gyroscope.y, z: @gyroscope.z } }
    assert_redirected_to gyroscope_url(@gyroscope)
  end

  test "should destroy gyroscope" do
    assert_difference("Gyroscope.count", -1) do
      delete gyroscope_url(@gyroscope)
    end

    assert_redirected_to gyroscopes_url
  end
end
