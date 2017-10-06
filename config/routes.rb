Rails.application.routes.draw do
  post 'add_to_cart' => 'cart#add_to_cart'

  get 'view_order' => 'cart#view_order'

  get 'checkout' => 'cart#checkout'

  root 'storefront#all_shoes'

  get 'categorical' => 'storefront#shoes_by_category'

  get 'branding' => 'storefront#shoes_by_brand'

  get 'sizes' => 'storefront#shoes_by_size'

  devise_for :users
  resources :shoes

   get 'backroom' => 'shoes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
