Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'master/admins/sessions',
    registrations: 'master/admins/registrations'
  }
  devise_for :restaurants
  devise_for :users

  namespace :master do
    get '/' => 'admins#top'
    resources :users
    resources :restaurants
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
