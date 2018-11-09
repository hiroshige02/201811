require "application_system_test_case"

class DeskEventsTest < ApplicationSystemTestCase
  setup do
    @desk_event = desk_events(:one)
  end

  test "visiting the index" do
    visit desk_events_url
    assert_selector "h1", text: "Desk Events"
  end

  test "creating a Desk event" do
    visit desk_events_url
    click_on "New Desk Event"

    fill_in "Desk", with: @desk_event.desk_id
    fill_in "Event", with: @desk_event.event_id
    click_on "Create Desk event"

    assert_text "Desk event was successfully created"
    click_on "Back"
  end

  test "updating a Desk event" do
    visit desk_events_url
    click_on "Edit", match: :first

    fill_in "Desk", with: @desk_event.desk_id
    fill_in "Event", with: @desk_event.event_id
    click_on "Update Desk event"

    assert_text "Desk event was successfully updated"
    click_on "Back"
  end

  test "destroying a Desk event" do
    visit desk_events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Desk event was successfully destroyed"
  end
end
