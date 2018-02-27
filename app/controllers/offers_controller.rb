class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = Offer.find(params[:user_id])
    @offer.save
  end

  private

  def offer_params
    params.require(:offer).permit(:price, :location, :date_time)
  end
end
