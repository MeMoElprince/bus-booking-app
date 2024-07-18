require "test_helper"

class CitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cities_index_url
    assert_response :success
  end

  test "should get create" do
    get cities_create_url
    assert_response :success
  end

  test "should get destroy" do
    get cities_destroy_url
    assert_response :success
  end
end
