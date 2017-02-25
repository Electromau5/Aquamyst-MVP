class Category < ActiveRecord::Base

	has_many :subcategories
	has_many :listings

extend FriendlyId

  	friendly_id :name

def self.search(search)
  if search
    search_length = search.split.length
    where([(['name ILIKE ?'] * search_length).join(' AND ')] + search.split.map { |name| "%#{name}%" }) 
    where([(['tag ILIKE ?'] * search_length).join(' AND ')] + search.split.map { |tag| "%#{tag}%" })
  else
    find(:all)
  end 
end
end

