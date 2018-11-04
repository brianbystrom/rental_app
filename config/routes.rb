Rails.application.routes.draw do
  root  'home#index'
  get 'sessions/new'
  resources :users
  resources :rentals
  resources :items
  get     'home/index'
  get     '/signup',  to: 'users#new'
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  get     '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
