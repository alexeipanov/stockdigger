Rails.application.routes.draw do
  resources :positions
  resources :collections do
  	resources :keywords
  	resources :images
  end

  resources :users do

  end

  get 'me' => 'users#me'
  get 'profile' => 'profile#show'
  post 'user_token' => 'user_token#create'
end