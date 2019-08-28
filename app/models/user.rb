class User < ApplicationRecord
  validates :name, presence: true,  uniqueness: true, length: { maximum: 15 }
  validates :email, presence: true, uniqueness: true, format: {with: /\w+@\w+\.\w+/}
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{4,32}\z/i}

  has_secure_password

  has_many :memos
  has_many :favorites
  has_many :favorite_memos, through: :favorites, source: 'memo'

end
