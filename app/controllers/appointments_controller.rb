class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def show
    @appointment = Appointment.find(params[:id])
    @offer = @appointment.offer
    authorize @appointment
  end

  def create
    @appointment = Appointment.new(offer_id: params[:offer_id])
    authorize @appointment
    @appointment.user = current_user
    if @appointment.save!
      redirect_to pages_profile_path
    else
      render "offers/show"
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    if params[:commit] == "approve"
      @appointment.status = "accepted"
    elsif params[:commit] == "decline"
      @appointment.status = "rejected"
    end
    authorize @appointment
    @appointment.save
    redirect_to appointment_path(@appointment)
  end

end
