Rails.application.routes.draw do

  namespace :public do
    get 'bookmarks/index'
    get 'bookmarks/show'
  end
  namespace :public do
    get 'reservations/index'
    get 'reservations/show'
    get 'reservations/new'
    get 'reservations/confirm'
    get 'reservations/completion'
  end
  namespace :public do
    get 'menus/index'
    get 'menus/show'
  end
  namespace :public do
    get 'restaurants/index'
    get 'restaurants/show'
  end
  namespace :public do
    get 'users/show'
    get 'users/info'
    get 'users/edit'
    get 'users/profile'
    get 'users/withdraw'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
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
      registrations: 'public/users/registrations'
    }
    get '/' => 'homes#top'
    get 'about' => 'homes#about'
    resources :users do
      resources :bookmarks
    end
    resources :reservations
    resources :restaurants
    resources :menus
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
