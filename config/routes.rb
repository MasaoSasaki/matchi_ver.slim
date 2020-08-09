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
      sessions: 'master/restaurants/sessions',
      registrations: 'master/restaurants/registrations'
    }
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
