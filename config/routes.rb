Rails.application.routes.draw do
  
  post 'sign-up', to: 'users#create'
  get 'sign-up', to: 'users#sign_up'

  get 'sign-in', to: 'sessions#sign_in'
  post 'sign-in', to: 'sessions#create'

  get 'sign-out', to: 'sessions#sign_out'

  get 'homepage', to: 'sessions#homepage'

  get 'challenge/:id', to: 'challenge#challenge'

  get 'active-challenge', to: 'active_challenge#active_challenge'
  post 'join-challenge', to: 'active_challenge#create'
  
  get 'add-activity/:id', to: 'active_challenge#add_activity'
  post 'add-activity', to: 'active_challenge#update_challenge'

  get 'completed-challenge/:id', to: 'completed_challenge#complete'

  get 'strava', to: 'strava_api#link_with_strava'
  get 'strava-oauth', to: 'strava_api#oauth'

  get 'strava/sync_activties/:id', to: 'strava_api#sync_strava_activties'

  root to: "landing_page#landing_page"
end