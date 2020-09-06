Rails.application.routes.draw do

  get 'contacts/new'
  post 'contacts/create'
  get '/' => 'public/homes#top', as: 'root'
  get 'about' => 'public/homes#about'
  get 'contact' => 'contacts#new'
  get 'privacy' => 'public/homes#privacy'
  get 'terms' => 'public/homes#terms'
  get 'admin' => 'public/homes#admin'
  get 'redirect' => 'public/homes#redirect'
  get 'mypage' => 'public/users#show'
  get 'mypage/edit' => 'public/users#edit'
  get 'mypage/withdraw' => 'public/users#withdraw'
  get 'myprofile' => 'public/users#profile'
  get 'myinfo' => 'public/users#info'

  namespace :master do
    devise_for :admins, controllers: {
      sessions: 'master/admins/sessions',
      registrations: 'master/admins/registrations'
    }
    get '/' => 'admins#top'
    resources :users, only: [:index, :show, :update]
    resources :restaurants, only: [:index, :show]
    resources :tags, only: [:index, :create, :destroy]
  end

  namespace :owner do
    devise_for :restaurants, controllers: {
      sessions: 'owner/restaurants/sessions',
      registrations: 'owner/restaurants/registrations'
    }
    resources :restaurants, only: [:show, :edit, :update] do
      resources :menus
    end
    resources :reservations, only: [:index, :show, :update]
    resources :menu_tags, only: [:create, :destroy]
  end

  namespace :public do
    devise_for :users, controllers: {
      sessions: 'public/users/sessions',
      registrations: 'public/users/registrations',
      passwords: 'public/users/passwords'
    }
    # get '/' => 'homes#top'
    resources :users, only: [:update] do
      resources :bookmarks, only: [:index, :show]
      get 'reservations/confirm' => 'reservations#confirm'
      get 'reservations/completion' => 'reservations#completion'
      resources :reservations, only: [:index, :show, :new, :create]
    end

    patch 'users/:id/withdrawal' => 'users#withdrawal', as: 'users/withdrawal'
    get 'users/:id/withdrew' => 'users#withdrew', as: 'users/withdrew'

    resources :restaurants, only: [:index, :show]
    resources :menus, only: [:index, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
