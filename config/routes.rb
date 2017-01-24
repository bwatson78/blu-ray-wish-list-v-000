Rails.application.routes.draw do
  resources :actors
  resources :directors
  resources :genres
  resources :movies
  resources :discs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
