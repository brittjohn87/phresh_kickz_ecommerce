class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :categories, :brands
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role, :name])
  end

  def categories 
  	@categories = Category.order(:name)
  end

  def brands 
  	@brands = Shoe.pluck(:brand).sort.uniq
  end

  # def sizes
  # 	@sizes = Size.order(:size)
  # end
end

