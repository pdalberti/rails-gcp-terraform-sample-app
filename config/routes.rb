Rails.application.routes.draw do
  # devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :dnd, only: [] do
    collection do
      get :kouzla
      get :predmety
    end
  end

  resources :fate, only: [] do
    collection do
      get :triky
    end
  end

  resources :drd2, only: [] do
    collection do
      get :schopnosti
    end
  end
end
