class Category < ActiveRecord::Base

extend FriendlyId
friendly_id :name

has_many :subcategories
has_many :listings


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

