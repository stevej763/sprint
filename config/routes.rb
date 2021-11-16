Rails.application.routes.draw do
  post 'sign-up', to: 'users#create'
  get 'sign-up', to: 'users#sign_up'

  get 'sign-in', to: 'sessions#sign_in'
  post 'sign-in', to: 'sessions#create'

  get 'homepage', to: 'sessions#homepage'
  
  root to: "landing_page#landing_page"
end