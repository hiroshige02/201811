class Equipment < ApplicationRecord
 belongs_to :dummy
 validates :equipment, presence: true
end
