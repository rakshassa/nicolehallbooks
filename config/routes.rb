Rails.application.routes.draw do
  resources :groups
  root to: "homes#show"

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy] do
    collection do
      post :ready
      post :validate
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
      get :signup
      get :subscribed
      get :thank_you
    end
  end

  resources :news_items
  resources :subscriptions, only: [:create]
end
