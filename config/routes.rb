Rails.application.routes.draw do
  resources :users
  get 'profile' => 'profile#show'
  post 'user_token' => 'user_token#create'
end
