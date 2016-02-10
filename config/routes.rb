Rails.application.routes.draw do
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
    resources :comments, only: [:index, :new, :create], default: {format: :json}

    root 'users#index'
  end
end
