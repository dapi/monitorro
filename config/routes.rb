Rails.application.routes.draw do
  concern :archivable do
    member do
      delete :archive
      post :restore
    end
  end

  root controller: 'dashboard', action: 'index'

  resources :sessions, only: %i[new create] do
    collection do
      delete :destroy
    end
  end
  resource :user, only: [:edit, :update], controller: :user

  resources :rates, only: [:index]
  resources :exchanges, only: [:index, :show] do
    concerns :archivable
    member do
      get :go
    end
  end
  scope '/admin', module: :admin, as: :admin do
    root :to => redirect('/admin/exchanges')
    resources :affiliate_events do
      collection do
        get :months
        get :days
      end
    end
    resources :exchanges
    resources :currencies, only: [:index]
    resources :payment_systems do
      member do
        put :ignore
        put :allow
      end
    end
    resources :users, only: [:index]
    resources :exchange_links, only: [:new, :create]
  end
end
