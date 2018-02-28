class Offer < ApplicationRecord
  belongs_to :user
  has_many :appointments

  validates :location, presence: true
  validates :date_time, presence: true
  validates :price, presence: true
end
