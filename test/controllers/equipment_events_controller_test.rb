require 'test_helper'

class EquipmentEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipment_event = equipment_events(:one)
  end

  test "should get index" do
    get equipment_events_url
    assert_response :success
  end

  test "should get new" do
    get new_equipment_event_url
    assert_response :success
  end

  test "should create equipment_event" do
    assert_difference('EquipmentEvent.count') do
      post equipment_events_url, params: { equipment_event: { equipment_id: @equipment_event.equipment_id, event_id: @equipment_event.event_id } }
    end

    assert_redirected_to equipment_event_url(EquipmentEvent.last)
  end

  test "should show equipment_event" do
    get equipment_event_url(@equipment_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_equipment_event_url(@equipment_event)
    assert_response :success
  end

  test "should update equipment_event" do
    patch equipment_event_url(@equipment_event), params: { equipment_event: { equipment_id: @equipment_event.equipment_id, event_id: @equipment_event.event_id } }
    assert_redirected_to equipment_event_url(@equipment_event)
  end

  test "should destroy equipment_event" do
    assert_difference('EquipmentEvent.count', -1) do
      delete equipment_event_url(@equipment_event)
    end

    assert_redirected_to equipment_events_url
  end
end
