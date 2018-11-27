class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :admin_name, presence: true, length: { maximum:15 }
  validates :admin_name_kana, presence: true, format: { with:/[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/}
  validates :admin_tel_number, presence: true, length: {minimum:7, maximum:11 }, numericality:{only_integer: true}
end
