Rails.application.routes.draw do
  root to: "home#top"
  get 'home/top'
  resources :home
  devise_for :users
  resources :users do
  collection do
      get :user_to_all_rooms
      get :reserved_rooms
    end
  end

  resources :application do
    collection do
      get 'search'
    end
  end

  resources :rooms do
  end

  resources :reservations do
    member do
      post :confirm
    end
  end

end
