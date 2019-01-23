Rails.application.routes.draw do


root 'events#top'
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


    namespace :admin do
      resources :past_events do
        collection do
          get 'past_month'
        end
      end
      resources :equipments
      resources :regist_users
      resources :events do
         member do
           get 'check'
           get 'approve'
           get 'sayno'
         end
       end
    end

    namespace :regist_user do
      resources :past_events, only: [:show, :index]
      resources :regist_users, only: [:destroy]
      resources :events do
        collection do
          get 'pulldown'
          get 'modal'
        end
        member do
          patch 'no_image'
        end
      end
    end

  resources :past_events
  resources :events, only: [:show, :index] do
    collection do
      get 'first'
      get 'top'
      get 'next_month'
    end
  end

  resources :regist_users, :only => [:index, :show]
  resources :admins, :only => [:show]
  get '/regist_users/:id/taikai', to: 'regist_users#taikai', as: 'regist_user_taikai'
  # get '/events/top', to: 'events#top', as: 'top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
