Rails.application.routes.draw do
  root to: "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"


  devise_for :users

  resources :teachers, only: %i[index show]

  get 'students/show'
  # get 'teachers/index'
  # get 'teachers/show'


  resources :reviews, only: [:new, :create]
  # get "new", to: "review#new"
end
