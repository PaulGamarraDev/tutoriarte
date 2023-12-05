Rails.application.routes.draw do
  root to: "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  devise_for :users
  resources :teachers, only: %i[index show]
  get 'students/show'

  resources :bookings

  resources :subjects

  resources :reviews, only: [:new, :create, :index, :destroy]
end
