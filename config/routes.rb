Rails.application.routes.draw do

  resources :offers do
    resources :appointments, only: [:create]
  end

  resources :appointments, only: [:show, :update]

  get 'pages/profile'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
