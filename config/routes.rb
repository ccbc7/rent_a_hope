Rails.application.routes.draw do
  root to: "home#top"
  get 'home/top'
  resources :home do
    collection do
      get :search #ransack検索用
    end

  end
  devise_for :users
  resources :users do
  collection do
      get :user_to_all_rooms
      get :search #ransack検索用
    end
  end

  resources :application do
  end

  resources :rooms do
    collection do
      get :registered_rooms
      get 'search'#ransack検索用
    end

  end

  resources :reservations do
    collection do
      get :reserved_rooms
    end
    member do
      post :confirm
    end
  end

end
