class AppointmentsController < ApplicationController
  def show
  end

  # def new
  #   @appointment = Appointment.new
  #   @offer = Offer.find(params[:id])
  # end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    if @appointment.save!
      redirect_to pages_profile_path
    else
      render :new
    end

  end

private

  def appointment_params
    params.require(:appointment).permit(:offer_id, :status)
  end
end
