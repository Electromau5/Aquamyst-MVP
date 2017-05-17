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
        redirect_to admin_path
    else
        render 'edit'
    end
end

def show
	@category = Category.friendly.find(params[:id])
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

def category_params
	params.require(:category).permit(:name, :title, :description, :keywords, :image_c)
end

end

