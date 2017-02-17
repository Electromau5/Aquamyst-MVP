class AddKeywordsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :keywords, :string
  end
end
