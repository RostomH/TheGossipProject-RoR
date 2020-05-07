Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'front#home'
  # get '/home', to: 'front#home'
  # get '/', to: 'front#home'
  get 'team', to: 'front#team'
  get 'contact', to: 'front#contact'
  get 'welcome', to: 'front#welcome'
  get 'showgossip/:id', to: 'front#showgossip', as: 'show_gossip'
  get 'showuser/:id', to: 'front#showuser', as: 'show_user'

  resources :gossips
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]
end
