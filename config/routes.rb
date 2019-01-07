Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  
  resources :chats, only: [:new, :index, :show]
  resources :pages, only: [:index]
  
  put 'chat/join/:id(.:format)', :to => 'chats#join', :as => :join_chat
  
  root 'pages#index'
end
