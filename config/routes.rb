Rails.application.routes.draw do

  get '/' => 'public/homes#top', as: 'root'
  get 'about' => 'public/homes#about'

  namespace :master do
    devise_for :admins, controllers: {
      sessions: 'master/admins/sessions',
      registrations: 'master/admins/registrations'
    }
    get '/' => 'admins#top'
    resources :users
    resources :restaurants
  end

  namespace :owner do
    devise_for :restaurants, controllers: {
      sessions: 'owner/restaurants/sessions',
      registrations: 'owner/restaurants/registrations'
    }
    get '/' => 'restaurants#show'
    resources :restaurants do
      resources :menus
    end
    resources :reservations
  end

  namespace :public do
    devise_for :users, controllers: {
      sessions: 'public/users/sessions',
      registrations: 'public/users/registrations',
      passwords: 'public/users/passwords'
    }
    # get '/' => 'homes#top'
    resources :users do
      resources :bookmarks
      get 'reservations/confirm' => 'reservations#confirm'
      get 'reservations/completion' => 'reservations#completion'
      resources :reservations
    end

    get 'users/:id/profile' => 'users#profile', as: 'users/profile'
    get 'users/:id/info' => 'users#info', as: 'users/info'
    get 'users/:id/withdraw' => 'users#withdraw', as: 'users/withdraw'
    patch 'users/:id/withdrawal' => 'users#withdrawal', as: 'users/withdrawal'
    get 'users/:id/withdrew' => 'users#withdrew', as: 'users/withdrew'

    resources :restaurants
    resources :menus
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
