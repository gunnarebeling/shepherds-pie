Rails.application.routes.draw do
  devise_for :employees
  resources :pizzas, only: [ :update ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#index"

  get "home/index", to: "home#index", as: "home_index"

  get "orders/new", to: "orders#new", as: :new_order
  post "orders", to: "orders#create"
  get "orders/:id", to: "orders#show", as: :order

  delete "pizzas/:id", to: "pizzas#destroy", as: :destroy_pizza

  delete "orders/:id", to: "orders#destroy", as: :destroy_order

  patch "orders/:id", to: "orders#update", as: :edit_order

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
