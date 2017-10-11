Rails.application.routes.draw do
# User Routes
  get 'all_users' => 'admin#all_users'

  get 'show_user' => 'admin#show_user'

  post 'edit_user' => 'admin#edit_user'
  
  post 'delete_user' => 'admin#delete_user'
  
  get 'delete_user' => 'admin#delete_user'
  
  # Cart Routes
  post 'add_to_cart' => 'cart#add_to_cart'

  get 'view_order' => 'cart#view_order'

  get 'checkout' => 'cart#checkout'

  get 'edit_line_item' => 'cart#edit_line_item'

  post 'edit_line_item' => 'cart#edit_line_item'

  post 'delete_line_item' => 'cart#delete_line_item'
  
  get 'delete_line_item' => 'cart#delete_line_item'

  post 'order_complete' => 'cart#order_complete'


# Storefront Routes
  root 'storefront#all_shoes'

  get 'categorical' => 'storefront#shoes_by_category'

  get 'branding' => 'storefront#shoes_by_brand'

  get 'sizes' => 'storefront#shoes_by_size'

  get 'contact_us' => 'storefront#contact_us'

  

  devise_for :users
  resources :shoes

   get 'backroom' => 'shoes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
