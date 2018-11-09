require 'test_helper'

class Admin::DesksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @desk = desks(:one)
  end

  test "should get index" do
    get desks_url
    assert_response :success
  end

  test "should get new" do
    get new_desk_url
    assert_response :success
  end

  test "should create desk" do
    assert_difference('Desk.count') do
      post desks_url, params: { desk: { desk: @desk.desk } }
    end

    assert_redirected_to desk_url(Desk.last)
  end

  test "should show desk" do
    get desk_url(@desk)
    assert_response :success
  end

  test "should get edit" do
    get edit_desk_url(@desk)
    assert_response :success
  end

  test "should update desk" do
    patch desk_url(@desk), params: { desk: { desk: @desk.desk } }
    assert_redirected_to desk_url(@desk)
  end

  test "should destroy desk" do
    assert_difference('Desk.count', -1) do
      delete desk_url(@desk)
    end

    assert_redirected_to desks_url
  end
end
