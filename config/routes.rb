Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/login' => 'sessions#new'
 	post '/login' => 'sessions#create'
 	get '/logout' => 'sessions#destroy'

 	
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  resources :users, controller: "users", only: [:show]

  resources :matches, controller: "matches" do
    resources :bookings, only: [:create, :new, :show]
  end

  get "search" => "search#index"



end