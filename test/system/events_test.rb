require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h1", text: "Events"
  end

  test "creating a Event" do
    visit events_url
    click_on "New Event"

    fill_in "Admin Message", with: @event.admin_message
    fill_in "Admin No", with: @event.admin_no
    fill_in "Admin Ok", with: @event.admin_ok
    fill_in "Content", with: @event.content
    fill_in "Event Image", with: @event.event_image_id
    fill_in "Finish Time", with: @event.finish_time
    fill_in "Participand", with: @event.participand
    fill_in "Regist User", with: @event.regist_user_id
    fill_in "Start Time", with: @event.start_time
    fill_in "Title", with: @event.title
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "updating a Event" do
    visit events_url
    click_on "Edit", match: :first

    fill_in "Admin Message", with: @event.admin_message
    fill_in "Admin No", with: @event.admin_no
    fill_in "Admin Ok", with: @event.admin_ok
    fill_in "Content", with: @event.content
    fill_in "Event Image", with: @event.event_image_id
    fill_in "Finish Time", with: @event.finish_time
    fill_in "Participand", with: @event.participand
    fill_in "Regist User", with: @event.regist_user_id
    fill_in "Start Time", with: @event.start_time
    fill_in "Title", with: @event.title
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "destroying a Event" do
    visit events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event was successfully destroyed"
  end
end
