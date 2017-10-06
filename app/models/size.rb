class Size < ApplicationRecord

	has_many :categories
	belongs_to :shoe
end
