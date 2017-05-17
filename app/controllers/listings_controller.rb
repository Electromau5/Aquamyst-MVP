class ListingsController < ApplicationController
    
before_action :set_listing, only: [:show, :edit, :update, :destroy]
before_action :authenticate_seller!, except: [:index, :show, :landing, :save, :remove]
before_action :authenticate_user!, only: [:save, :remove]
before_action :require_sameseller, only: [:edit, :update, :destroy]


  def landing
    @listings = Listing.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 16)
  end

  def index
   @listings = Listing.all.order("updated_at DESC").paginate(:page => params[:page], :per_page => 16)
   if params[:search]
      @listings = Listing.search(params[:search]).order("updated_at DESC").paginate(:page => params[:page], :per_page => 16)
    else
      @listings = Listing.all.order("updated_at DESC").paginate(:page => params[:page], :per_page => 16)
    end
  end

  def new
    @listing = current_seller.listings.build
  end

    def create
      @listing = current_seller.listings.build(listing_params)
      if @listing.save
        redirect_to listing_path(@listing)
      else
        render 'new'
      end
    end

    def edit
    end

    def update
        if @listing.update(listing_params)
        redirect_to listing_path(@listing)
      else
        render 'edit'
      end
    end

    def show
      @user = current_user
      #@listing_user = current_user.listings(@listing)
      @listing_seller = @listing.seller
      set_meta_tags title: "#{@listing.name}",
                    keywords: "#{@listing.tag}",
                    description: "#{@listing.description}",
                    image_src: "#{@listing.image.url(:medium)}"
    end

    def destroy
        @listing.destroy
        redirect_to root_path
    end

    def save
        @listing = Listing.friendly.find(params[:id])
        current_user.listings << @listing
        redirect_to :back, flash: { success: 'Tee has been added to your catalogue'} 
    end

    def remove 
      @listing = Listing.friendly.find(params[:id])
      current_user.listings.delete(@listing)
      redirect_to :back, flash: { success: 'Tee has been removed from your catalogue'} 
    end

    def remove_image2
      @listing = Listing.friendly.find(params[:id])
      @listing.image2.destroy
      @listing.save
      redirect_to edit_listing_path, flash: { success: 'Image has been removed' }
    end

    private
    def listing_params
       params.require(:listing).permit(:name, :feature1, :feature2, :feature3, :feature4, :feature5, 
                                       :price, :cod, :time, :description, :image, 
                                       :image2, :image3, :image4, :image5, :site, :category_id, 
                                       :subcategory_id, :gender, :tag, :keywords, :permalink )
    end

    def set_listing
        @listing = Listing.friendly.find(params[:id])
    end


    def require_sameseller
       if current_seller != @listing.seller && !current_seller.admin 
         redirect_to root_path 
      end
    end
end