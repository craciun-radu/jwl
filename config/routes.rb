Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root "jewels#index"
    
    devise_for :users, :controllers => { registrations: 'registrations' }
    
    resources :jewels
    
    resources :categories
    
    resources :cart_orders
    
    get :add_jewel_to_cart_order, to: "cart_orders#add_jewel"
    get :add_jewel_to_cart_favourite, to: "cart_favourites#add_jewel"
    
    get :remove_jewel_from_cart_order, to: "cart_orders#remove_jewel"
  end
end
