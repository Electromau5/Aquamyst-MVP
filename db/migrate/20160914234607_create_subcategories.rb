class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
    	t.string :name
    	t.text :description
    	t.string :gender1
    	t.string :gender2
    	t.string :gender3
    	t.boolean :apparel, default: false
    	t.boolean :accessory, default: false
    	t.boolean :mobile, default: false
    	t.boolean :laptop, default: false
    	t.boolean :home, default: false
    	t.boolean :other, default: false
    	t.integer :category_id
    end
  end
end
