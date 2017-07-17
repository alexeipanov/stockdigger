Rails.application.routes.draw do
    scope '/api' do
      devise_for :users
    end

    namespace :users do
    resources :users
  end
end
