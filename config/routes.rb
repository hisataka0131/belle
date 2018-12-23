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
root 'users#top'
get 'posts/rank', to: 'posts#rank'
get 'users/top', to: 'users#top'
resources :users 
resources :stylists do
	resources :follows, only: [:create, :destroy, :show]
  resources :salons, expect: [:index]
end
resources :posts do
    resource :favorites, only: [:create, :destroy]
    resource :post_comments, only: [:create, :destroy]
end
resources :messages, only: [:create]
resources :rooms, only: [:create, :show, :index]
resources :user_chats, only: [:show, :create]
resources :chat_messages, only: [:create]
resources :boards do
	resource :board_comments, only: [:create, :destroy]
end


end
