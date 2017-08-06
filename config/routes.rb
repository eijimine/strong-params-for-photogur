Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources 'pictures'
  resources 'users'
  resources 'sessions'
  root 'pictures#index'
 #  get 'pictures' => 'pictures#index'
 #
 #  delete 'pictures/:id' => 'pictures#destroy'
 #
 #  get 'pictures/:id/edit' => "pictures#edit"
 # patch 'pictures/:id' => "pictures#update"
 #
 #  post 'pictures' => 'pictures#create'
 #  get 'pictures/new' => 'pictures#new'
 #
 #  get 'pictures/:id' => 'pictures#show'
 #
 #  post 'pictures/by_year' => 'pictures#by_year'
 #
 #  post 'users' => 'users'#create'
 #  get 'users/new' => 'users#new'

end
