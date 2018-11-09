json.extract! past_event, :id, :past_start_time, :past_finish_time, :past_title, :past_content, :past_name, :past_user_mail_address, :past_participant, :past_event_image_id, :created_at, :updated_at
json.url past_event_url(past_event, format: :json)
