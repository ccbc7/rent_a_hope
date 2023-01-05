Rails.application.routes.draw do
  root to: "home#top"
  get 'home/top'
  resources :home
  devise_for :users
  resources :users

  resources :application do
    collection do
      get 'search'
    end
  end

  resources :rooms do
    collection do
      get "registered_rooms"
    end
  end

  resources :reservations do
      member do
        post :confirm
      end
    end

end
