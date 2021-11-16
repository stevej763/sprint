Rails.application.routes.draw do
  resources :users, only: [:sign_up, :create]
  get 'sign-up', to: 'users#sign_up'
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  get 'homepage', to: 'sessions#homepage'
  root to: "landing_page#landing_page"
end