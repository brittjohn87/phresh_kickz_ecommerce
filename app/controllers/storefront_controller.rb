class StorefrontController < ApplicationController
  def all_shoes
  	@shoes = Shoe.all
  end

  def shoes_by_category
  	@shoes = Shoe.where(category: params[:category_id])
  	@category = Category.find(params[:category_id])
  end

  def shoes_by_brand
    @shoes = Shoe.where(brand: params[:brand])
    @brand = params[:brand]
  end

  # def shoes_by_size
  #   @shoes = Shoe.where(size: params[:size])
  #   @sizes = Size.find(params[:size])
  # end
end
