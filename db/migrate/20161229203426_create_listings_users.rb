class CreateListingsUsers < ActiveRecord::Migration
  def change
    create_table :listings_users do |t|
      t.integer :listing_id
      t.integer :user_id
    end
  end
end
