class Category < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :name

  def should_generate_new_friendly_id?
    name_changed?
  end

  has_many :subcategories
  has_many :listings

  has_attached_file :image_c, styles: { box_1: ["400x400>", :jpg, :quality => 70], 
                     box_2: ["450x450>", :jpg, :quality => 70], box_3: 
                    ["600x600>", :jpg, :quality => 70] }

  validates_attachment_content_type :image_c, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

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

