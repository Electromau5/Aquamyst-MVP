class AddKeywordsToSellers < ActiveRecord::Migration
  def change
    add_column :sellers, :keywords, :string
  end
end
