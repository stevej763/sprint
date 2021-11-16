Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'landing_page/landing_page'
  root to: "landing_page#landing_page"
end