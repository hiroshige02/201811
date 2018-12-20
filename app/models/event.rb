class Event < ApplicationRecord

belongs_to :regist_user
attachment :event_image
has_many :desk_numbers, dependent: :destroy

validates :start_time, :finish_time, :title, :participant, :desk, presence: true
validates :content, presence: true, length: { minimum:10 }

end