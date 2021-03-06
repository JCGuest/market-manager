Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create', as: "sessions"
  get '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/sessions', to: 'sessions#new'
  get 'clerks', to: 'clerks#new'
  root 'application#hello'
  # root 'sessions#new'
  
  resources :patrons, only: [:show, :edit, :update, :destroy] do
    resources :orders, only:[:show]
  end

  resources :clerks, only: [:new, :create] do
    resources :orders
  end

  post '/clerks/:clerk_id/orders/:id/delete', to: 'orders#destroy', as: 'clerk_order_delete'
  patch '/clerks/:clerk_id/orders/:id/update', to: 'orders#update', as: 'update_clerk_order'
  post '/clerks/:clerk_id/orders/:id/update', to: 'orders#update'
  get '/clerks/:clerk_id/orders/:id/update', to: "orders#edit"
  patch '/patrons/:id/update', to: 'patrons#update', as: 'update_patron'
  post '/patrons/:patron_id/update', to: 'patrons#update'
  get '/patron/:patron_id/delete', to: 'patrons#destroy', as: 'delete_patron'
  get '/clerks/:clerk_id/today', to: 'orders#today', as: 'clerk_orders_today'
  get '/patrons/:id/update', to: 'patrons#edit'
end
