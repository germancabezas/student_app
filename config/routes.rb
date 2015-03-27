Rails.application.routes.draw do

  devise_for :users
  resources :courses
  get '/' => 'home_pages#index', :as => :home_pages
  get '/home_pages/about' => 'home_pages#about'

  resources :usercourses
  resources :chapters

  get '/searches' => 'searches#index'


  get 'users/:id' => 'users#show', :as => 'user'
  patch 'users/:id' => 'users#update'



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
