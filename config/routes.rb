Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :stylists, controllers: {
  sessions:      'stylists/sessions',
  passwords:     'stylists/passwords',
  registrations: 'stylists/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
root 'stylists#index'
get 'users/top', to: 'users#top'
resources :users
resources :stylists

end
