Rails.application.routes.draw do

  devise_for :users

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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
