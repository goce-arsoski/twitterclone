Rails.application.routes.draw do
  root 'tweets#index'

  resources :tweets
  get 'tweets/all/:id', to: 'tweets#all', as: :tweets_all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
