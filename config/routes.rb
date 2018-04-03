Rails.application.routes.draw do
  resources :calendars
  resources :trashes
  get 'users/index'

  resources :rooms
  resources :courses
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
  get 'users', to: 'users#index', as: 'users'
  post 'pub_trash', to: 'trashes#pub_trash', as: 'pub_trash'
  get 'pub_trash', to: 'trashes#pub_trash', as: 'published_trash'
  # get 'user/:id', to: 'users#show', as: 'user'
  # get 'user/edit/:id', to: 'users#edit', as: 'user_edit'

  resources :user, :controller => "users"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#index'
  # Home pages
  get 'home/tarefas', to: 'home#tarefas'

  # Swap tasks

  get '/trashes/swap/:id', to: 'trashes#swap_trash', as: 'swap_trash' # Swap trash
  get '/notifications/send/:id/:table', to: 'notifications#new', as: 'send_notification'
  get '/notifications/:id', to: 'notifications#show', as: 'notification'
  get '/notifications', to: 'notifications#index', as: 'notifications'
  post '/notifications', to: 'notifications#create'
  delete '/notifications/:id', to: 'notifications#destroy'
  post '/notifications/response', to: 'notifications#notification_response'
  get '/gerar_tabela', to: 'trashes#generate_trash_table', as: 'generate_trash_table'

end
