Rails.application.routes.draw do
    root to: "public/homes#top"
    get '/about' => 'public/homes#about'
    get '/admin' => 'admin/homes#top'

  # 管理者用
  # URL /admin/sign_in ...
    devise_for :admin,skip: [:registrations, :passwords], controllers: {
      sessions: "admin/sessions"
    }
  # 顧客用
   #URL /customers/sign_in...
    devise_for :customers,skip: [:passwords], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }

  namespace :admin do

      resources :customers, only: [:index, :show, :edit, :update]
      resources :items, only: [:new, :create, :index, :show, :edit, :update]
      resources :orders
      resources :genres, except: [:destroy, :show]
      resources :order_details
    end

  scope module: :public do

    resources :items, only: [:index, :show]
    get 'customers/unsubscribe'
    get 'customers/check'
    get 'customers/mypage', to: 'customers#show', as: 'mypage'
    get 'customers/information/edit', to: 'customers#edit', as: 'edit_information'
    patch 'customers/information', to: 'customers#update'
    patch 'customers/withdraw', to: 'customers#withdraw'
    resources :cart_items, only: [:create, :index, :update, :destroy] do
     collection do
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    end
    end
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
    post '/orders/confirm' => 'orders#confirm', as: 'confirm'
    get '/orders/complete' => 'orders#complete', as: 'complete'
      end
    end
    resources :addresses, only: [:create, :index, :edit, :update, :destroy]
  end
end