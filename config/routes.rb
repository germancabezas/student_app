Rails.application.routes.draw do

  devise_for :users
  resources :courses
  get '/' => 'courses#index'
  resources :usercourses
  resources :chapters

  get '/searches' => 'searches#index'


  # get '/' => 'home_page#index'
  #    get '/products' => 'products#index'
  #    get '/products/new' => 'products#new'
  #    get '/products/:id' => 'products#show'
  #    post '/products' => 'products#create'
  #    get '/products/:id/edit' => 'products#edit'
  #    patch '/products/:id' =>'products#update'
  #    delete 'products/:id' =>'products#destroy'
  #    patch '/orders/:id' => 'orders#update'

  #    get '/cartedproducts' => 'cartedproducts#index'
  #    post '/cartedproducts' => 'cartedproducts#create'







end
