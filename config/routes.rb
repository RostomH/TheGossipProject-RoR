Rails.application.routes.draw do
  get 'static_pages/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'team', to: 'front#team'
  get 'contact', to: 'front#contact'

  get 'welcome/:first_name', to: 'front#welcome'

end
