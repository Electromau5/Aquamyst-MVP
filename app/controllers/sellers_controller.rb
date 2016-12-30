class SellersController < ApplicationController

before_action :authenticate_user!, only: [:follow, :unfollow]

#before_filter :authenticate_seller!

  def show
    @seller = Seller.friendly.find(params[:id])
    @seller_listings = @seller.listings
  end

  def follow
     @seller = Seller.friendly.find(params[:id])
     current_user.sellers << @seller
     redirect_to seller_path(@seller)
  end

  def unfollow 
      @seller = Seller.friendly.find(params[:id])
      current_user.sellers.delete(@seller)
      redirect_to seller_path(@seller)
  end
end