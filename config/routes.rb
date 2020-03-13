Rails.application.routes.draw do
  devise_for :users

  resources :tweets
  resources :follows, only: [:create, :destroy, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tweets#index'
end
