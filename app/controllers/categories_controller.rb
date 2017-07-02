class CategoriesController < ApplicationController

before_action :set_category, only: [:show, :edit, :update, :destroy]

def index
	@categories = Category.all
end

def new
	@category = Category.new
end

def create
	@category = Category.new(category_params)
		if @category.save
			flash[:success] = "Category was created successfully"
				redirect_to categories_path
		else
			render 'new'
		end
end

def edit

end

def update
	if @category.update(category_params)
        redirect_to admin_path
    else
        render 'edit'
    end
end

def show
	@category_subcategories = @category.subcategories
	#@category_listings = @category.listings.order("created_at DESC")
	if params[:search]
    	@category_listings = @category.listings.search(params[:search]).order("updated_at DESC").paginate(:page => params[:page], :per_page => 16)
    else
      	@category_listings = @category.listings.order("updated_at DESC").paginate(:page => params[:page], :per_page => 16)
    end
	set_meta_tags title: "#{@category.title}",
                  keywords: "#{@category.keywords}",
                  description: "#{@category.description}",
                  image_src: "#{@category.image_c.url(:box_3)}"
end

private

def set_category
	@category = Category.friendly.find(params[:id])
end

def category_params
	params.require(:category).permit(:name, :title, :description, :keywords, :image_c)
end

end

