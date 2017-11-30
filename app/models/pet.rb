class Pet < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
end
