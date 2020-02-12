Rails.application.routes.draw do
  
  get '/login', to: 'sessions#new'
  get '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'

  root 'orders#index'

  # resources :orders
  resources :clerks, only: [:new, :create] do
    resources :orders, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
