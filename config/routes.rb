Rails.application.routes.draw do

devise_for :admins, controllers: {
    sessions:       'admins/sessions',
    passwords:      'admins/passwords',
    registrations:  'admins/registrations'
  }
  devise_for :regist_users, controllers: {
    sessions:      'regist_users/sessions',
    passwords:     'regist_users/passwords',
    registrations: 'regist_users/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
    namespace :admin do
      resources :board_messages
      resources :past_events
      #resources :equipment_events
      #resources :attendances
     # resources :desks
      resources :desk_events
      resources :events
      resources :regist_users
      resources :regist_users
  end

    namespace :regist_user do
    resources :board_messages
    resources :past_events
   # resources :equipment_events
    #resources :attendances
    #resources :desks
    resources :desk_events
    resources :events
    resources :users, only: [:show]
    resources :regist_users, only: [:show, :index]
  end

  #resources :board_messages
  resources :past_events
  #resources :equipment_events
  #resources :attendances
  #resources :desks
  #resources :desk_events
  resources :events, only: [:show, :index] do
    collection do
      get 'first'
      get 'top'
    end
  end

  resources :regist_users, :only => [:index, :show]

  get '/users/:id/taikai', to: 'users#taikai', as: 'taikai'
  get '/regist_users/:id/taikai', to: 'regist_users#taikai', as: 'regist_user_taikai'
  # get '/events/top', to: 'events#top', as: 'top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
