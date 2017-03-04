class Subcategory < ActiveRecord::Base
	
belongs_to :category
has_many :listings

extend FriendlyId
friendly_id :name

end

