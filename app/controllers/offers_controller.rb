class OffersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_offer, only: [:show, :destroy, :edit, :update]

  def index
    @offers = policy_scope(Offer).order(created_at: :desc)
    # @offers = Offer.where.not(latitude: nil, longitude: nil)
    # @offers = policy_scope(Offer).near(params[:location], 100)

    @markers = @offers.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
      }
    end
  end

  def new
    @offer = Offer.new
    authorize @offer
  end

  def show
    authorize @offer
    @appointment = Appointment.new()
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    authorize @offer

    if @offer.save!
      redirect_to offer_path(@offer)
    end
  end

  def destroy
    if @offer.appointments.empty?
      @offer.destroy!
      redirect_to offers_path
    else
      flash[:alert] = "You cannot delete offers that have appointments."
      redirect_to offer_path(@offer)
    end
  end

  def edit
    # @offer.edit(offer_params)
    # redirect_to offer_path(@offer)
  end

  def update
    @offer.update(offer_params)
    redirect_to offer_path(@offer)
  end

  private

  def offer_params
    params.require(:offer).permit(:price, :location, :date_time, :photo, :name)
  end

  def set_offer
    @offer = Offer.find(params[:id])
    authorize @offer
  end
end
