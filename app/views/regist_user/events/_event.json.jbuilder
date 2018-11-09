json.extract! event, :id, :start_time, :finish_time, :title, :regist_user_id, :content, :admin_ok, :admin_message, :admin_no, :participand, :event_image_id, :created_at, :updated_at
json.url event_url(event, format: :json)
