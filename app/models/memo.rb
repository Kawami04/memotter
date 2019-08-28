class Memo < ApplicationRecord
  validates :user_id, presence: true
  validates :main, presence: true

  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: "user"
end
