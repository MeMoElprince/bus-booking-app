require "test_helper"

class Api::V1::TripsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_trips_index_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_trips_create_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_trips_show_url
    assert_response :success
  end

  test "should get delete" do
    get api_v1_trips_delete_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_trips_update_url
    assert_response :success
  end
end
