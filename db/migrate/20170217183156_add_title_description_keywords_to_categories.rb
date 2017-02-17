class AddTitleDescriptionKeywordsToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :title, :string
    add_column :categories, :description, :text
    add_column :categories, :keywords, :string
  end
end
