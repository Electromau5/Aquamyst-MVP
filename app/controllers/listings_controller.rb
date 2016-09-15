class ListingsController < ApplicationController
    
before_action :set_listing, only: [:show, :edit, :update, :destroy]
before_action :authenticate_seller!, except: [:index, :show, :landing]
before_action :require_sameseller, only: [:edit, :update, :destroy]


  def landing
    @listings = Listing.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 16)
  end

  def index
   @listings = Listing.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 16)
   if params[:search]
      @listings = Listing.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 16)
    else
      @listings = Listing.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 16)
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
      @listing_seller = @listing.seller
    end

    def destroy
        @listing.destroy
        redirect_to root_path
    end

    def remove_image2
      @listing = Listing.find(params[:id])
      @listing.image2.destroy
      @listing.save
      redirect_to edit_listing_path, flash: { success: 'Image has been removed' }
    end

    private
    def listing_params
       params.require(:listing).permit(:name, :feature1, :feature2, :feature3, :feature4, :feature5, 
                                       :price, :cod, :time, :description, :image, 
                                       :image2, :image3, :image4, :image5, :site, :category_id, :subcategory_id, :gender, :tag)
    end

    def set_listing
        @listing = Listing.find(params[:id])
    end


    def require_sameseller
      if current_seller != @listing.seller
        redirect_to root_path 
      end
    end
end