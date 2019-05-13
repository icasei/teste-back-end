Rails.application.routes.draw do
resources :contatos
resources :relatorios
root 'pages#index'
get 'sobre', to: 'pages#sobre'
get 'relatorio', to: 'pages#relatorio'
get 'contato', to: 'pages#contato'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
