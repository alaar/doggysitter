class Offer < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  belongs_to :user
  has_many :appointments

  validates :location, presence: true
  validates :date_time, presence: true
  validates :price, presence: true
end
