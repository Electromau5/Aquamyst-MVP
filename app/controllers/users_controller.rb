class UsersController < ApplicationController

#before_filter :authenticat_user!

  def show
    @user = User.friendly.find(params[:id])
    @user_listings = @user.listings
  end

  def show_follow
  	@user = User.friendly.find(params[:id])
  	@user_sellers = @user.sellers
  end
end