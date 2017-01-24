class Category < ActiveRecord::Base

	has_many :subcategories
	has_many :listings

extend FriendlyId

  	friendly_id :name
  	
end

