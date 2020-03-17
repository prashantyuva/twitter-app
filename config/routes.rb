Rails.application.routes.draw do
  devise_for :users

  resources :users do
  	resources :tweets
  	resources :follows, only: [:create, :destroy]
  	get 'followers', action: :followers, controller: 'follows'
  	get 'following', action: :following, controller: 'follows'
  end
  # resources :tweets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tweets#index'
end
