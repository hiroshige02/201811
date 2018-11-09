require 'test_helper'

class Admin::DeskEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @desk_event = desk_events(:one)
  end

  test "should get index" do
    get desk_events_url
    assert_response :success
  end

  test "should get new" do
    get new_desk_event_url
    assert_response :success
  end

  test "should create desk_event" do
    assert_difference('DeskEvent.count') do
      post desk_events_url, params: { desk_event: { desk_id: @desk_event.desk_id, event_id: @desk_event.event_id } }
    end

    assert_redirected_to desk_event_url(DeskEvent.last)
  end

  test "should show desk_event" do
    get desk_event_url(@desk_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_desk_event_url(@desk_event)
    assert_response :success
  end

  test "should update desk_event" do
    patch desk_event_url(@desk_event), params: { desk_event: { desk_id: @desk_event.desk_id, event_id: @desk_event.event_id } }
    assert_redirected_to desk_event_url(@desk_event)
  end

  test "should destroy desk_event" do
    assert_difference('DeskEvent.count', -1) do
      delete desk_event_url(@desk_event)
    end

    assert_redirected_to desk_events_url
  end
end
