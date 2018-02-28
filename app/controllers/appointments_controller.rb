class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def show
    @appointment = Appointment.find(params[:id])
  end

  def create
    @appointment = Appointment.new(offer_id: params[:offer_id])
    @appointment.user = current_user
    if @appointment.save!
      redirect_to pages_profile_path
    else
      render "offers/show"
    end
  end

end
