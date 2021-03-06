Rails.application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => "callbacks"}

  post 'discs/:id/purchase', to: 'discs#purchase', as: 'purchase'
  get 'discs/owned', to: 'discs#owned'

  resources :discs do
    resources :movies, only: [:show, :new, :create, :destroy]
  end

  resources :movies do
    resources :genres, only: [:new, :create, :destroy]
  end

  resources :genres, only: [:show, :index]
  resources :discs
  post 'user_discs/:id/publicize', to: 'user_discs#publicize', as: 'publicize'

  root 'discs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
