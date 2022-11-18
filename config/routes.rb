Rails.application.routes.draw do  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users
  
  root "splash#index"

  resources :users
  resources :categories do
    resources :expenses
  end

  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/delete'
  # get 'users/destroy'

  # get 'categories/index'
  # get 'categories/show'
  # get 'categories/new'
  # get 'categories/edit'
  # get 'categories/update'
  # get 'categories/delete'
  # get 'categories/destroy'

  # get 'expenses/index'
  # get 'expenses/show'
  # get 'expenses/new'
  # get 'expenses/edit'
  # get 'expenses/update'
  # get 'expenses/delete'
  # get 'expenses/destroy'

end
