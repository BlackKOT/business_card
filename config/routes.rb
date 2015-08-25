Rails.application.routes.draw do
  devise_for :users

  scope module: 'admin', path: '/admin', as: 'admin' do
    resources :users
    resources :projects
    resources :components
    get '', to: 'users#index'
  end

  scope '/(:locale)', locale: /en|ru/ do
    resources :users, only: [:index, :show] do
      resources :projects, only: [:index]
    end
    resources :projects, only: [:show]
    resources :comments, only: [:index, :new, :create]

    root 'users#index'
  end
end
