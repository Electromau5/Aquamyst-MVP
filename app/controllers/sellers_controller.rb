class SellersController < ApplicationController

before_action :authenticate_user!, only: [:follow, :unfollow]

#before_filter :authenticate_seller!

  def show
    @seller = Seller.friendly.find(params[:id])
    @seller_listings = @seller.listings.order("updated_at DESC").paginate(:page => params[:page], :per_page => 16)
    set_meta_tags title: "#{@seller.name}",
                  keywords: "#{@seller.keywords}",
                  description: "#{@seller.description}"
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