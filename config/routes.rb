Rails.application.routes.draw do
  get 'boards/index'
  get 'boards/show'
  get 'boards/edit'
  get 'boards/new'
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
get 'posts/rank', to: 'posts#rank'
get 'users/top', to: 'users#top'
resources :users 
resources :stylists do
	resources :follows, only: [:create, :destroy]
end
resources :posts do
    resource :favorites, only: [:create, :destroy]
end
resources :messages, only: [:create]
resources :rooms, only: [:create, :show, :index]
resources :user_chats, only: [:show, :create]
resources :chat_messages, only: [:create]
resources :boards do
	resource :board_comments, only: [:create, :destroy]
end


end
