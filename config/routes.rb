Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :shows , only: [:index] do
    post :mark_as_favourite
  end
end
