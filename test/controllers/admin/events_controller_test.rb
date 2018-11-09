require 'test_helper'

class Admin::EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

  test "should get new" do
    get new_event_url
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post events_url, params: { event: { admin_message: @event.admin_message, admin_no: @event.admin_no, admin_ok: @event.admin_ok, content: @event.content, event_image_id: @event.event_image_id, finish_time: @event.finish_time, participand: @event.participand, regist_user_id: @event.regist_user_id, start_time: @event.start_time, title: @event.title } }
    end

    assert_redirected_to event_url(Event.last)
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { admin_message: @event.admin_message, admin_no: @event.admin_no, admin_ok: @event.admin_ok, content: @event.content, event_image_id: @event.event_image_id, finish_time: @event.finish_time, participand: @event.participand, regist_user_id: @event.regist_user_id, start_time: @event.start_time, title: @event.title } }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
