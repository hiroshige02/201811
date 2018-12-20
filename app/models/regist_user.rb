class RegistUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :events, dependent: :destroy

  validates :regist_name, length:{ maximum:15 }, presence: true
  validates :regist_tel_number, numericality:{only_integer: true}
  validates :birthday, numericality:{only_integer: true}, presence: true, length:{is:8}
  validates :regist_name_kana, format: { with:/[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/}, presence: true
  validates :job, presence: true

end
