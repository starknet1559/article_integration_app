Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }

  scope module: :public do
    root to: "homes#top"
    get '/about', to: 'homes#about', as: 'about'
    resources :users, except: [:destroy,:new,:create]
    patch '/users/:id/withdraw' => 'users#withdraw', as: 'withdraw'
    resources :posts, except: [:edit,:update]
    resources :genres, only: [:index,:create,:show] do
      resource :genre_likes, only: [:create, :destroy]
    end

  end
  
  devise_for :admins, controllers: {
    sessions:      'admin/sessions',
    registrations: 'admin/registrations'
  }

  namespace :admin do
    resources :users, only: [:index,:update]
  end

  

end
