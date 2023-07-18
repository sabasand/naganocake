Rails.application.routes.draw do
  get '/' => 'public/homes#top'
  get '/about' => 'public/homes#about'
  get '/admin' => 'admin/homes#top'
end
  
# 管理者用
# URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
# 顧客用
# URL /customers/sign_in...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

namespace :public do
  get 'customers/check'
  get 'customers/my_page', to: 'customers#show', as: 'my_page'
end

namespace :public do
  root to: "homes#top"
  get 'customers/unsubscribe'
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

namespace :admin do
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:index, :show]
end

