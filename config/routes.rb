Rails.application.routes.draw do
  get 'expenses/index'
  get 'expenses/show'
  get 'expenses/new'
  get 'expenses/edit'
  get 'expenses/delete'
  get 'categories/index'
  get 'categories/show'
  get 'categories/new'
  get 'categories/edit'
  get 'categories/delete'
  get 'entities/index'
  get 'entities/show'
  get 'entities/new'
  get 'entities/edit'
  get 'entities/delete'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  get 'users/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
