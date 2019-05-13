Rails.application.routes.draw do
  resources :contacts, only: [:new, :create, :show]

  resources :visits, only: :create

  get '/visits/report', to: 'visits#report'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
