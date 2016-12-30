class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :location, length: { maximum: 140 }
  validates :description, length: { maximum: 140 }
  extend FriendlyId
  friendly_id :name

  has_and_belongs_to_many :listings
  has_and_belongs_to_many :sellers
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/images/user.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end 