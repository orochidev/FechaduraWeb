require 'test_helper'

class RAsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ra = ras(:one)
  end

  test "should get index" do
    get ras_url
    assert_response :success
  end

  test "should get new" do
    get new_ra_url
    assert_response :success
  end

  test "should create ra" do
    assert_difference('Ra.count') do
      post ras_url, params: { ra: {  } }
    end

    assert_redirected_to ra_url(Ra.last)
  end

  test "should show ra" do
    get ra_url(@ra)
    assert_response :success
  end

  test "should get edit" do
    get edit_ra_url(@ra)
    assert_response :success
  end

  test "should update ra" do
    patch ra_url(@ra), params: { ra: {  } }
    assert_redirected_to ra_url(@ra)
  end

  test "should destroy ra" do
    assert_difference('Ra.count', -1) do
      delete ra_url(@ra)
    end

    assert_redirected_to ras_url
  end
end
