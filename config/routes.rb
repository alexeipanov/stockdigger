Rails.application.routes.draw do
  resources :users do
    resources :images
  end
  get 'me' => 'users#me'
  get 'profile' => 'profile#show'
  post 'user_token' => 'user_token#create'
end
