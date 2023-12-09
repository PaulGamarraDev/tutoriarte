Rails.application.routes.draw do
  get 'dashboard/index'
  root to: "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  devise_for :users

  resources :teachers, only: %i[index show] do
    resources :reviews, only: [:new]
  end

  resources :reviews, only: [:create, :index, :destroy]

  get 'students/show'

  resources :bookings

  resources :subjects

end
