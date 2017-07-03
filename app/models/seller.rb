class Seller < ActiveRecord::Base
 
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
  has_many :listings
 
  validates :name, presence: true
 
  validates :name, uniqueness: true
  
  has_and_belongs_to_many :users

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
