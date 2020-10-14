Rails.application.routes.draw do
  get '/', to: 'welcome#index', as: 'root'

  get '/registration', to: 'users#new'
  post '/registration', to: 'users#create'

  post '/login', to: 'sessions#create'

  get '/dashboard', to: 'user/dashboard#index'

  resources :friends, only: [:create]
  resources :discover, only: [:index]
  resources :movies, only: [:index, :show]
  resources :parties, only: [:new, :create]
end
