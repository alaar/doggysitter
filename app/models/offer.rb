class Offer < ApplicationRecord
  belongs_to :user

  validates :location, presence: true
  validates :date_time, presence: true
  validates :price, presence: true
end
