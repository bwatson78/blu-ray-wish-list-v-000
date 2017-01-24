Rails.application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => "callbacks"}
  resources :actors
  resources :directors
  resources :genres
  resources :movies
  resources :discs

  root 'discs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
