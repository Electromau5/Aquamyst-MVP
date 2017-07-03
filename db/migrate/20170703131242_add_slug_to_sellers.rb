class AddSlugToSellers < ActiveRecord::Migration
  def change
    add_column :sellers, :slug, :string
    add_index :sellers, :slug
  end
end
