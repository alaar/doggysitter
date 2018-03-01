class AppointmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true
  end

  def show?
    record.user == user || record.offer.user == user
  end

  def update?
    record.offer.user == user
  end

end
