Rails.application.routes.draw do
  get "users/orders"
  get "users/:id", to: "users#view", as: "users_view"
  resources :address_infos
  delete "/address_infos.:id", to: "address_infos#destroy", as: "destroy_address_info"
  devise_for :users
  root "home#index"
  get "cart/view"
  get "cart/neworder"
  post "cart/view"
  post "cart/add"
  post "cart/checkout"
  post "cart/processorder"
  get "cart/checkout", to: "cart#view"
  get "/cart/add", to: "cart#view"
  get "/categories/:id", to: "categories#show", as: "category"
  get "/items/:id", to: "items#show", as: "item"
  get "home/index"
  get "home/about"
  get "home/contact"
  get "home/search"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
