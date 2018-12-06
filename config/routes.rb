Rails.application.routes.draw do
  get 'user_chats/show'
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
root 'posts#index'
get 'users/top', to: 'users#top'
resources :users
resources :stylists
resources :posts
resources :messages, only: [:create]
resources :rooms, only: [:create, :show, :index]
resources :user_chats, only: [:show, :create]
resources :chat_messages, only: [:create]


end
