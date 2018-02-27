class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    # ??? current_user works??
    if @offer.save
      redirect to offer_path(@offer)
    else
      render :root
      # ????????
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:user_id, :location, :date_time, :price)
    # ?????
  end
end
