class SellersController < ApplicationController

#before_filter :authenticate_seller!

  def show
    @seller = Seller.friendly.find(params[:id])
    @seller_listings = @seller.listings
  end
end