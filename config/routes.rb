Rails.application.routes.draw do
  root to: "homes#show"

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy] do
    collection do
      post :ready
    end
  end

  resource :homes, only: [:show], :path => "/" do
    collection do
      get :contact
      get :books
      get :about
      get :backdoor
      post :email
      get :privacy
      get :whitelist
    end
  end


  resources :characters do
    collection do
      post :import_characters
      post :import_character_gear
      post :import_character_stats
    end
    member do
      get :gear
      get :gear_slots
      get :stat_mods
    end
  end

  resources :news_items
  resources :subscriptions, only: [:create]
end
