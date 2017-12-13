require 'test_helper'

class DefaultitemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @defaultitem = defaultitems(:one)
  end

  test "should get index" do
    get defaultitems_url
    assert_response :success
  end

  test "should get new" do
    get new_defaultitem_url
    assert_response :success
  end

  test "should create defaultitem" do
    assert_difference('Defaultitem.count') do
      post defaultitems_url, params: { defaultitem: {  } }
    end

    assert_redirected_to defaultitem_url(Defaultitem.last)
  end

  test "should show defaultitem" do
    get defaultitem_url(@defaultitem)
    assert_response :success
  end

  test "should get edit" do
    get edit_defaultitem_url(@defaultitem)
    assert_response :success
  end

  test "should update defaultitem" do
    patch defaultitem_url(@defaultitem), params: { defaultitem: {  } }
    assert_redirected_to defaultitem_url(@defaultitem)
  end

  test "should destroy defaultitem" do
    assert_difference('Defaultitem.count', -1) do
      delete defaultitem_url(@defaultitem)
    end

    assert_redirected_to defaultitems_url
  end
end
