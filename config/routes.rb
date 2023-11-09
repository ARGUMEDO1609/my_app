Rails.application.routes.draw do
  post 'add/user', to: 'chats#add_user'
  resources :chats do
  resources :messages
  end
  devise_for :users
  root 'chats#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end