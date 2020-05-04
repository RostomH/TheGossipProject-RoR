Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/home', to: 'front#home'
  get '/', to: 'front#home'
  get 'team', to: 'front#team'
  get 'contact', to: 'front#contact'

  get 'welcome/:first_name', to: 'front#welcome'

end
