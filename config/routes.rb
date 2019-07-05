Rails.application.routes.draw do
  devise_for :users
  resources :meals
  resources :shops
  root to: 'shops#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
