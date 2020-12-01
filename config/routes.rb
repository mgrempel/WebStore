Rails.application.routes.draw do
  get 'user/address'
  devise_for :users
  root "home#index"
  get "cart/view"
  post "cart/view"
  post "cart/add"
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
