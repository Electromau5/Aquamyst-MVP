class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    	t.string :name
    	t.decimal :price
    	t.string :feature1
    	t.string :feature2
    	t.string :feature3
    	t.string :feature4
    	t.string :feature5
    	t.text :description
    	t.string :gender
    	t.string :tag
    	t.string :cod
    	t.string :time
    	t.string :site
    	t.attachment :image
    	t.attachment :image2
    	t.attachment :image3
    	t.attachment :image4
    	t.attachment :image5
    	t.timestamps
    end
  end
end
