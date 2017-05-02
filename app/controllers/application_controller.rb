class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def show
    set_meta_tags title: "We are a T-Shirt search engine"
    set_meta_tags :og => {
                      :image => @listing.image.url(:medium)
                      }
  end

  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :avatar,
               :description, :location, 
               :social1, :social2, 
               :social3, :social4, 
               :password, 
               :password_confirmation, 
               :profile)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :avatar,
               :description, :location, 
               :social1, :social2, 
               :social3, :social4, 
               :password, 
               :password_confirmation, 
               :profile, :keywords)
    end
  end
end
