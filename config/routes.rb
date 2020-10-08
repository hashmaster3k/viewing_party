Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/registration', to: 'users#new'
  post '/registration', to: 'users#create'

  post '/login', to: 'sessions#create'

  get '/dashboard', to: 'user/dashboard#index'

  resources :friends, only: [:create]
end
