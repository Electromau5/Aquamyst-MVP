class UsersController < ApplicationController

#before_filter :authenticat_user!

  def show
    @user = User.friendly.find(params[:id])
    @user_listings =@user.listings
  end
end