class Listing < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, length: { maximum: 75 }
  validates :image, presence: true
  validates :site, presence: true
  
  has_and_belongs_to_many :users

  
  has_attached_file :image, styles: { medium: ["300x300>", :jpg, :quality => 70], 
                     square: ["200x200>", :jpg, :quality => 70], thumb: 
                    ["100x100>", :jpg, :quality => 70],  large:  
                    ['1000>', :jpg, :quality => 70] }

  has_attached_file :image2, styles: { medium: ["300x300>", :jpg, :quality => 70], thumb: 
                    ["100x100>", :jpg, :quality => 70],  large:  
                    ['1000>', :jpg, :quality => 70] }

  has_attached_file :image3, styles: { medium: ["300x300>", :jpg, :quality => 70], thumb: 
                    ["100x100>", :jpg, :quality => 70],  large:  
                    ['1000>', :jpg, :quality => 70] }
  
  has_attached_file :image4, styles: { medium: ["300x300>", :jpg, :quality => 70], thumb: 
                    ["100x100>", :jpg, :quality => 70],  large:  
                    ['1000>', :jpg, :quality => 70] }     
  
  has_attached_file :image5, styles: { medium: ["300x300>", :jpg, :quality => 70], thumb: 
                    ["100x100>", :jpg, :quality => 70],  large:  
                    ['1000>', :jpg, :quality => 70] }

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_content_type :image2, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_content_type :image3, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_content_type :image4, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_content_type :image5, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
  belongs_to :category
  belongs_to :subcategory
  belongs_to :seller


def self.search(search)
  if search
    search_length = search.split.length
    #where([(['name LIKE ?'] * search_length).join(' AND ')] + search.split.map { |name| "%#{name}%" }) 
    where([(['tag ILIKE ?'] * search_length).join(' AND ')] + search.split.map { |tag| "%#{tag}%" })
  else
    find(:all)
  end 
end
end