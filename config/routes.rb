Rails.application.routes.draw do
  get 'dashboard/index'
  root to: "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  devise_for :users
  resources :teachers, only: %i[index show]
  get 'students/show'

  get 'dashboard', to: 'dashboard#index'

  resources :bookings

  resources :subjects

  resources :reviews, only: [:new, :create, :index, :destroy]

end
