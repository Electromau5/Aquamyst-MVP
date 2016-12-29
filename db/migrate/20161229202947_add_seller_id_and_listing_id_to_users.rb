class AddSellerIdAndListingIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :listing_id, :integer
    add_column :users, :seller_id, :integer
  end
end
