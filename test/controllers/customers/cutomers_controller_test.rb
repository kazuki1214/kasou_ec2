require 'test_helper'

class Customers::CutomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customers_cutomers_show_url
    assert_response :success
  end

  test "should get edit" do
    get customers_cutomers_edit_url
    assert_response :success
  end

  test "should get update" do
    get customers_cutomers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get customers_cutomers_destroy_url
    assert_response :success
  end

end
