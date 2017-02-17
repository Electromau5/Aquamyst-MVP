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

def edit
	@category = Category.friendly.find(params[:id])
end

def update
	@category = Category.friendly.find(params[:id])
	if @category.update(category_params)
        redirect_to category_path(@category)
    else
        render 'edit'
    end
end

def show
	@category = Category.friendly.find(params[:id])
	@category_subcategories = @category.subcategories
	@category_listings = @category.listings.order("created_at DESC")
	set_meta_tags title: "#{@category.title}",
                  keywords: "#{@category.keywords}",
                  description: "#{@category.description}"
end

private

def category_params
	params.require(:category).permit(:name, :title, :description, :keywords)
end

end

