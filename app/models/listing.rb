class Listing < ActiveRecord::Base


  validates :name, presence: true, length: { maximum: 75 }
  validates :gender, presence: true
  validates :feature1, :feature2, :feature3, presence: true, length: { maximum: 150 }
  validates :feature4, :feature5, length: { maximum: 150}
  validates :cod, presence: true
  validates :price, presence: true
  validates :time, presence: true
  validates :image, presence: true
  validates :site, presence: true
  validates :description, presence: true, length: { maximum: 500 }


  has_attached_file :image, styles: { medium: ["300x300>", :jpg, :quality => 70], thumb: 
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
    where([(['name LIKE ?'] * search_length).join(' AND ')] + search.split.map { |name| "%#{name}%" })
  else
    find(:all)
  end 
end
end