class CategoriesController < ApplicationController

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

def show
	@category = Category.friendly.find(params[:id])
	@category_subcategories = @category.subcategories
	@category_listings = @category.listings.order("created_at DESC").paginate(:page => params[:page], :per_page => 16)
end

private

def category_params
	params.require(:category).permit(:name)
end

end

