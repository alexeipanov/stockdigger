Rails.application.routes.draw do
  get 'errors/not_found'

  resources :collections do
  	resources :keywords
  	resources :images
    resources :positions
  end

  resources :users do

  end

  get 'me' => 'users#me'
  get 'profile' => 'profile#show'
  post 'user_token' => 'user_token#create'

  match "/404", :to => "errors#not_found", :via => :all
end