Rails.application.routes.draw do
  get 'booking/new'
  get 'booking/create'
  get 'booking/edit'
  get 'booking/update'
  get 'booking/destroy'
  get 'booking/show'
  get 'booking/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
