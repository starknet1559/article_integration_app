Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }

  scope module: :public do
    root to: "homes#top"
    resources :users, except: [:destroy,:new,:create] do
      resource :relationships, only: [:create, :destroy]
  	  get 'followings' => 'relationships#followings', as: 'followings'
  	  get 'followers' => 'relationships#followers', as: 'followers'
    end
    resource :relationships, only: [:create,:destroy]
    patch '/users/:id/withdraw' => 'users#withdraw', as: 'withdraw'
    resources :posts, except: [:edit,:update] do
       resource :post_goods, only: [:create, :destroy]
       resource :post_bads, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :genres, only: [:index,:create,:show] do
      resource :genre_likes, only: [:create, :destroy]
    end
    get '/search', to: 'searches#search'
    delete 'notifications/destroy_all', to: 'notifications#destroy_all', as: 'notifications_destroy_all'
    resources :notifications, only: [:index,:destroy]
  end

  namespace :admin do
    root to: "homes#top"
    resources :users, only: [:index,:update,:show]
    resources :posts, only: [:index,:destroy]
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

end
