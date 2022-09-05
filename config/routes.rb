Rails.application.routes.draw do

 devise_for :admins, controllers: {
    sessions:      'admin/sessions',
    registrations: 'admin/registrations'
  }

  namespace :admin do
    resources :users, only: [:index,:update]
  end

  devise_for :users, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }

  scope module: :public do
    root to: "homes#top"
    resources :users, except: [:destroy,:new,:create]
    patch 'users/:id/withdraw', to: 'users#withdraw', as: 'withdraw'

  end

end
