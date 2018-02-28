class OffersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_offer, only: [:show, :destroy, :edit, :update]

  def index
    @offers = policy_scope(Offer).order(created_at: :desc)
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

    if @offer.save
      redirect_to offer_path(@offer)
    end
  end

  def destroy
    @offer.destroy!
    redirect_to offers_path
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
    params.require(:offer).permit(:price, :location, :date_time)
  end

  def set_offer
    @offer = Offer.find(params[:id])
    authorize @offer
  end
end
