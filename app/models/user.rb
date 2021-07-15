class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers'
  validates :nickname, presence: true
  validates :birthday, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んー-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
    validates :first_name
    validates :family_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: 'is invalid. Input full-width katakana characters' } do
    validates :first_name_kana
    validates :family_name_kana
  end

end
