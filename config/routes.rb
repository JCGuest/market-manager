Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'

  root 'application#hello'

  resources :patrons, only: [:show, :edit, :update, :destroy] do
    resources :orders, only:[:show]
  end

  resources :clerks, only: [:new, :create] do
    resources :orders
  end

  post '/clerks/:clerk_id/orders/:id/delete', to: 'orders#destroy', as: 'clerk_order_delete'
  patch '/clerks/:clerk_id/orders/:id/update', to: 'orders#update', as: 'update_clerk_order'
  patch 'patrons/:patron_id/update', to: 'patrons#update', as: 'update_patron'
  get 'patron/:patron_id/delete', to: 'patrons#destroy', as: 'delete_patron'
  # get "/clerks/:clerk_id/orders/:order_id/update", to: 'orders#index'
end
