class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :status, inclusion: { in: ["accepted", "rejected", "pending"] }
end
