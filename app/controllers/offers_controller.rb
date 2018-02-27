class OffersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_offer, only: [:show, :destroy, :edit, :update]

  def index
    @offers = policy_scope(Offer).order(created_at: :desc)
  end

  def new
    @offer = Offer.new
  end

  def show
    # @offer = Offer.find(params[:id])
    @appointment = Appointment.new
  end

  def create
    # authorize @offer
    @offer = Offer.new(offer_params)
    @offer.user = current_user

    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  def destroy
    # @offer = Offer.find(params[:id])
    @offer.destroy
  end

  def edit
    # @offer = Offer.find(params[:id])
  end

  def update
    # @offer = Offer.find(params[:id])
    @offer.update(offer_params)

    redirect_to offer_path(@offer)
  end

  private

  def offer_params
    params.require(:offer).permit(:price, :location, :date_time)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
