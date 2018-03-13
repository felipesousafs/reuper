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
  # get 'user/:id', to: 'users#show', as: 'user'
  # get 'user/edit/:id', to: 'users#edit', as: 'user_edit'

  resources :user, :controller => "users"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#index'
end
