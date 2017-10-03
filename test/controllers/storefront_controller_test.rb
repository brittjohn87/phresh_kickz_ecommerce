require 'test_helper'

class StorefrontControllerTest < ActionDispatch::IntegrationTest
  test "should get all_shoes" do
    get storefront_all_shoes_url
    assert_response :success
  end

  test "should get shoes_by_category" do
    get storefront_shoes_by_category_url
    assert_response :success
  end

  test "should get shoes_by_brand" do
    get storefront_shoes_by_brand_url
    assert_response :success
  end

  test "should get shoes_by_size" do
    get storefront_shoes_by_size_url
    assert_response :success
  end

end
