class OffersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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
    @offer.user = current_user
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new
    end


  end

  private

  def offer_params
    params.require(:offer).permit(:price, :location, :date_time)
  end
end
