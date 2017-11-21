require 'test_helper'

class RfiDsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rfid = rfids(:one)
  end

  test "should get index" do
    get rfids_url
    assert_response :success
  end

  test "should get new" do
    get new_rfid_url
    assert_response :success
  end

  test "should create rfid" do
    assert_difference('Rfid.count') do
      post rfids_url, params: { rfid: {  } }
    end

    assert_redirected_to rfid_url(Rfid.last)
  end

  test "should show rfid" do
    get rfid_url(@rfid)
    assert_response :success
  end

  test "should get edit" do
    get edit_rfid_url(@rfid)
    assert_response :success
  end

  test "should update rfid" do
    patch rfid_url(@rfid), params: { rfid: {  } }
    assert_redirected_to rfid_url(@rfid)
  end

  test "should destroy rfid" do
    assert_difference('Rfid.count', -1) do
      delete rfid_url(@rfid)
    end

    assert_redirected_to rfids_url
  end
end
