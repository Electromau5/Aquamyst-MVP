class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :subcategories, :apparel, :nerd
  	rename_column :subcategories, :accessory, :motive
  	rename_column :subcategories, :mobile, :free
  	rename_column :subcategories, :laptop, :life
  	rename_column :subcategories, :home, :intr
  end
end
