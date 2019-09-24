class Memo < ApplicationRecord
  validates :user_id, presence: true
  validates :main, presence: true

  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: "user"

end
# Memo.first.favorites
# =>[{id: 3, user_id: 2,memo_id: 1},{id: 4, user_id: 1,memo_id: 1},{id: 5, user_id: 7,memo_id: 1}]
