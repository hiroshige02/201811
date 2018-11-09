require "application_system_test_case"

class PastEventsTest < ApplicationSystemTestCase
  setup do
    @past_event = past_events(:one)
  end

  test "visiting the index" do
    visit past_events_url
    assert_selector "h1", text: "Past Events"
  end

  test "creating a Past event" do
    visit past_events_url
    click_on "New Past Event"

    fill_in "Past Content", with: @past_event.past_content
    fill_in "Past Event Image", with: @past_event.past_event_image_id
    fill_in "Past Finish Time", with: @past_event.past_finish_time
    fill_in "Past Name", with: @past_event.past_name
    fill_in "Past Participant", with: @past_event.past_participant
    fill_in "Past Start Time", with: @past_event.past_start_time
    fill_in "Past Title", with: @past_event.past_title
    fill_in "Past User Mail Address", with: @past_event.past_user_mail_address
    click_on "Create Past event"

    assert_text "Past event was successfully created"
    click_on "Back"
  end

  test "updating a Past event" do
    visit past_events_url
    click_on "Edit", match: :first

    fill_in "Past Content", with: @past_event.past_content
    fill_in "Past Event Image", with: @past_event.past_event_image_id
    fill_in "Past Finish Time", with: @past_event.past_finish_time
    fill_in "Past Name", with: @past_event.past_name
    fill_in "Past Participant", with: @past_event.past_participant
    fill_in "Past Start Time", with: @past_event.past_start_time
    fill_in "Past Title", with: @past_event.past_title
    fill_in "Past User Mail Address", with: @past_event.past_user_mail_address
    click_on "Update Past event"

    assert_text "Past event was successfully updated"
    click_on "Back"
  end

  test "destroying a Past event" do
    visit past_events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Past event was successfully destroyed"
  end
end
