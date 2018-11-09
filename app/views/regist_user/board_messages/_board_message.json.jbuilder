json.extract! board_message, :id, :send_user_id, :receive_user_id, :body, :created_at, :updated_at
json.url board_message_url(board_message, format: :json)
