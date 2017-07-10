Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
namespace :api do
    namespace :v1 do
      resources :parties, only: [:index, :show, :create, :update, :destroy]
      resources :party_guests, only: [:index, :show, :create, :update, :destroy]
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :friendships, only: [:index, :show, :create, :update, :destroy]
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
    end
  end

end
