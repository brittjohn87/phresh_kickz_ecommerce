class LineItem < ApplicationRecord
	belongs_to :shoe
	belongs_to :order, optional: true
end
