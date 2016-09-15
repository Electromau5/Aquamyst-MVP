class AddSellerCategorySubcategoryToListings < ActiveRecord::Migration
  def change
    add_column :listings, :seller_id, :integer
    add_column :listings, :category_id, :integer
    add_column :listings, :subcategory_id, :integer
  end
end
