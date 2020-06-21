Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  root 'tweets#index'

  resources :tweets do
    resources :comments
  end

  resources :users
  get 'tweets/all/:id', to: 'tweets#all', as: :tweets_all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
