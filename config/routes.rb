Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  get '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'

  root 'application#hello'

  resources :patrons, only: [:show] do
    resources :orders, only:[:show]
  end

  resources :clerks, only: [:new, :create] do
    resources :orders
  end

  post '/clerks/:clerk_id/orders/:id/delete', to: 'orders#destroy', as: 'clerk_order_delete'
  patch '/clerks/:clerk_id/orders/:id/update', to: 'orders#update', as: 'update_clerk_order'

end
