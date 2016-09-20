class Applicant < ActiveRecord::Base
	validates :name, :email, :description, :location, :category, :site, presence: true
	validates :description, length: { minimum: 25, maximum: 200 }	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, length: {maximum: 105}, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
end