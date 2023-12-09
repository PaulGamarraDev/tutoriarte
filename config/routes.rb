Rails.application.routes.draw do
  root to: "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  devise_for :users

  resources :teachers, only: %i[index show] do
    resources :reviews, only: [:new]
  end

  resources :reviews, only: [:create, :index, :destroy]

  get 'students/show'

  resources :bookings do
    member do
      get 'initiate_payment'
      post 'process_payment'
    end
  end

  resources :subjects
end
