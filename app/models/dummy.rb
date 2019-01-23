class Dummy < ApplicationRecord

  has_many :equipments, dependent: :destroy
  accepts_nested_attributes_for :equipments, allow_destroy: true
end
