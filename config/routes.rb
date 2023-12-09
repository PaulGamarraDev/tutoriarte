Rails.application.routes.draw do
  get 'dashboard/index'
  root to: "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  devise_for :users

  resources :teachers, only: [:index, :show]
  resources :students, only: :show

  resources :bookings do
    member do
      get 'initiate_payment'
      post 'process_payment'
    end
  end

  resources :subjects
  resources :reviews, only: [:new, :create, :index, :destroy]

end


