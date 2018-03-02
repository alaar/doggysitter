class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :offers
  has_many :appointments

  validates :email, uniqueness: true

  def appointments_for_my_offers
    appointments_of_my_offers = []

    offers.each do |offer|
      appointments_of_my_offers << offer.appointments
    end

    appointments_of_my_offers.flatten
  end
end
