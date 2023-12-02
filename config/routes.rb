Rails.application.routes.draw do

  
  devise_for :users
  resources :bookings
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"


  devise_for :users

  # root "subjects#index"


  # Defines the root path route ("/")
  resources :subjects
  resources :teachers, only: %i[index show]

  get 'students/show'
  # get 'teachers/index'
  # get 'teachers/show'


  resources :reviews, only: [:new, :create]
  # get "new", to: "review#new"
  
end


