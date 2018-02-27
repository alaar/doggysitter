Rails.application.routes.draw do

  resources :offers, only: [:index, :show, :create] do
    resources :appointments, only: [:create, :update]
  end

  resources :appointments, only: [:show]

  get 'pages/home'
  get 'pages/profile'
  get 'offers/:id', to: 'offers#show'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
