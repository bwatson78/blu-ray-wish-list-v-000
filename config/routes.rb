Rails.application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => "callbacks"}

  post 'discs/:id/purchase', to: 'discs#purchase', as: 'purchase'
  get 'discs/owned', to: 'discs#owned'

  resources :discs do
    resources :movies
  end

  resources :movies do
    resources :actors
    resources :genres
  end

  resources :actors
  resources :directors
  resources :genres
  resources :discs

  root 'discs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
