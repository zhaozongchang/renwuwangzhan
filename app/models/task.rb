class Task < ApplicationRecord
  validates :description, :score, presence: true
  belongs_to :user

  scope :recent, -> { order("created_at DESC")}

end
