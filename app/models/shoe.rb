class Shoe < ApplicationRecord
	mount_uploader :image, ImageUploader

	belongs_to :user
	belongs_to :category
	has_many :sizes

	
end
