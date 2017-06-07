Rails.application.routes.draw do
  get 'calendar/show'

  root to: 'pages#home'

  devise_for :users

  resources :users
  resource :calendar, only: [:show], controller: :calendar
end
