class StorefrontController < ApplicationController
  def all_shoes
  	@shoes = Shoe.all
  end

  def shoes_by_category
  end

  def shoes_by_brand
  end

  def shoes_by_size
  end
end
