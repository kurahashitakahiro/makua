Rails.application.routes.draw do

  root 'users/posts#index'
  devise_for :admins, path: 'auth', path_names: { sign_in: 'panda_and_coffee_with_ryoko_play_login', sign_out: 'panda_and_coffee_with_ryoko_play_logout', password: 'panda_and_coffee_with_ryoko_play_secret', confirmation: 'panda_and_coffee_with_ryoko_play_verification', unlock: 'panda_and_coffee_with_ryoko_play_unblock', registration: 'panda_and_coffee_with_ryoko_play_register', sign_up: 'panda_and_coffee_with_ryoko_play_cmon_let_me_in' }, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations',
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
  }

  namespace :admins do
  	resources :users, only: [:index, :show]
    put 'users/:id/hide' => 'users#hide', as: 'users_hide'

    resources :gives, only: [:index, :show]
    put 'gives/:id/hide' => 'gives#hide', as: 'gives_hide'

    resources :posts, only: [:index, :show]
    put 'posts/:id/hide' => 'posts#hide', as: 'posts_hide'

    resources :tags, only: [:index, :create]
    put 'tags/:id/hide' => 'tags#hide', as: 'tags_hide'
  end

  namespace :users do
    get 'homes/about' => 'homes#about'
    get ':id/unsubscribe' => "homes#unsubscribe", as: "unsubscribe"
    get 'search' => 'homes#search'

    resources :users, only: [:show, :edit, :update]
    put 'users/:id/hide' => 'users#hide', as: 'users_hide'
    get '/users/:id' => 'users#favorites', as: 'favorites'
    get '/users/:id' => 'users#rooms', as: 'rooms'

    resources :rooms, only: [:show, :create]
    put 'rooms/:id/hide' => 'rooms#hide', as: 'rooms_hide'

    resources :gives, only: [:index, :show, :new, :create, :edit, :update] do
    	resources :give_comments, only: [:create, :destroy]
    end
    put 'gives/:id/hide' => 'gives#hide', as: 'gives_hide'

    resources :posts, only: [:index, :show, :new, :create, :edit, :update] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    put 'posts/:id/hide' => 'posts#hide', as: 'posts_hide'

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
