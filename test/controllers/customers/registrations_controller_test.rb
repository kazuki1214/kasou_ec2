require 'test_helper'

class Customers::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customers_registrations_new_url
    assert_response :success
  end

  test "should get create" do
    get customers_registrations_create_url
    assert_response :success
  end

end
