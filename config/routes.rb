Rails.application.routes.draw do

  
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :bookings

  root to: "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  # root "subjects#index"


  # Defines the root path route ("/")
  resources :subjects
  resources :teachers, only: %i[index show]

  get 'students/show'
  # get 'teachers/index'
  # get 'teachers/show'


  resources :reviews, only: [:new, :create, :index, :destroy]
  # get 'finish', to "pages#finish"
  # get "new", to: "review#new"

end
