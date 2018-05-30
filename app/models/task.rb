class Task < ApplicationRecord
  validates :title, presence: true
  belongs_to :user

  scope :recent, -> { order("created_at DESC")}

end
