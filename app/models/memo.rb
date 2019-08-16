class Memo < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true

  belong_to :user
end
