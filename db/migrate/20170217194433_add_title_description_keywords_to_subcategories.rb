class AddTitleDescriptionKeywordsToSubcategories < ActiveRecord::Migration
  def change
    add_column :subcategories, :title, :string
    add_column :subcategories, :keywords, :string
  end
end
