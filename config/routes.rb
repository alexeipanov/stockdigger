Rails.application.routes.draw do
    scope '/api' do
      devise_for :users
    end
end
