Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

# 管理者用
# URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


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
end
