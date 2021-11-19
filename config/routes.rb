Rails.application.routes.draw do
  get 'active_challenge/create'
  post 'sign-up', to: 'users#create'
  get 'sign-up', to: 'users#sign_up'

  get 'sign-in', to: 'sessions#sign_in'
  post 'sign-in', to: 'sessions#create'

  get 'sign-out', to: 'sessions#sign_out'

  get 'homepage', to: 'sessions#homepage'

  get 'challenge/:id', to: 'challenge#challenge'

  get 'active-challenge', to: 'active_challenge#active_challenge'
  post 'join-challenge', to: 'active_challenge#create'

  root to: "landing_page#landing_page"
end