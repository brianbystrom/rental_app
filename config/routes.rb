Rails.application.routes.draw do
  resources :comments
  root  'home#index'
  get 'sessions/new'
  resources :users
  resources :rentals
  resources :items
  
  get     'home/index'
  get     '/signup',      to: 'users#new'
  get     '/login',       to: 'sessions#new'
  post    '/login',       to: 'sessions#create'
  get     '/logout',      to: 'sessions#destroy'
  get     '/items',       to: 'items#index'
  get     '/items/:id',   to: 'items#show'
  post    '/items/new',   to: 'items#new'
  post    '/rentals/approve_rental', to: 'rentals#approve_rental'
  post    '/rentals/deny_rental', to: 'rentals#deny_rental'
  post    '/rentals/buyer_rental_rating', to: 'rentals#buyer_rental_rating'
  post    '/rentals/seller_rental_rating', to: 'rentals#seller_rental_rating'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
