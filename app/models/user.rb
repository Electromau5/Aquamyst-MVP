class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true 
  extend FriendlyId
  friendly_id :name

  has_and_belongs_to_many :listings

  has_attached_file :profile, styles: { medium: ["300x300>", :jpg, :quality => 70], thumb: 
                    ["100x100>", :jpg, :quality => 70],  large:  
                    ['1000>', :jpg, :quality => 70] }

  validates_attachment_content_type :profile, :content_type => ["profile/jpg", "profile/jpeg", "profile/png", "profile/gif"]      
end
