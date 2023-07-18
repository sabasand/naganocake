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
      resources :orders, only: [:index, :show]
      resources :genres, only: [:new, :index, :show, :edit, :update]
    end

  namespace :public do
    get 'customers/unsubscribe'
    get 'customers/check'
    get 'customers/mypage', to: 'customers#show', as: 'mypage'
    get 'customers/information/edit', to: 'customers#edit', as: 'edit_information'
    patch 'customers/information', to: 'customers#update'
    patch 'customers/withdraw', to: 'customers#withdraw'
    resources :items, only: [:index, :show]
     delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
     resources :cart_items, only: [:create, :index, :update, :destroy]
     resources :orders, only: [:new, :create, :index, :show]
     post '/orders/confirm' => 'orders#confirm', as: 'confirm'
     get '/orders/complete' => 'orders#complete', as: 'complete'
     resources :addresses, only: [:create, :index, :show, :edit, :update, :destroy]
  end
end