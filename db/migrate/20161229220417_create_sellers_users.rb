class CreateSellersUsers < ActiveRecord::Migration
  def change
    create_table :sellers_users do |t|
      t.integer :seller_id
      t.integer :user_id
    end
  end
end
