require "application_system_test_case"

class EquipmentEventsTest < ApplicationSystemTestCase
  setup do
    @equipment_event = equipment_events(:one)
  end

  test "visiting the index" do
    visit equipment_events_url
    assert_selector "h1", text: "Equipment Events"
  end

  test "creating a Equipment event" do
    visit equipment_events_url
    click_on "New Equipment Event"

    fill_in "Equipment", with: @equipment_event.equipment_id
    fill_in "Event", with: @equipment_event.event_id
    click_on "Create Equipment event"

    assert_text "Equipment event was successfully created"
    click_on "Back"
  end

  test "updating a Equipment event" do
    visit equipment_events_url
    click_on "Edit", match: :first

    fill_in "Equipment", with: @equipment_event.equipment_id
    fill_in "Event", with: @equipment_event.event_id
    click_on "Update Equipment event"

    assert_text "Equipment event was successfully updated"
    click_on "Back"
  end

  test "destroying a Equipment event" do
    visit equipment_events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Equipment event was successfully destroyed"
  end
end
