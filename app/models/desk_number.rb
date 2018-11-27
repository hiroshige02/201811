class DeskNumber < ApplicationRecord
  belongs_to :event, dependent: :destroy
end
