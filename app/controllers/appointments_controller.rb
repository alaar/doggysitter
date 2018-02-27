class AppointmentsController < ApplicationController
  def show
  end

  # def new
  #   @appointment = Appointment.new
  #   @offer = Offer.find(params[:id])
  # end

  def create
    @appointment = Appointment.new(appointment_params)

  end

private

  def appointment_params
    params.require(:appointment).permit(:offer_id, :status)
  end
end
