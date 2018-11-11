class Event < ApplicationRecord

#今月
scope :current_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }

#来月
scope :last_month, -> { where(created_at: Time.now.prev_month.beginning_of_month..Time.now.prev_month.end_of_month) }
belongs_to :regist_user

end