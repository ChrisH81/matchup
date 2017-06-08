Rails.application.routes.draw do
  get 'calendar/show'

  root to: 'pages#home'

  devise_for :users

  resources :users do
    member do
      put 'toggle', :action => :toggle_approve
    end
  end

  resource :calendar, only: [:show], controller: :calendar
end
