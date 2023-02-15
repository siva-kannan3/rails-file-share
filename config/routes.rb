Rails.application.routes.draw do
  resources :documents
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get "/document/download/:key", to: "documents#download"

  root 'documents#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
