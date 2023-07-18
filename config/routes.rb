Rails.application.routes.draw do
# 顧客用
 #URL /customers/sign_in...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
 root :to => "public/homes#top"  # Topページを設定
# 管理者用
# URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
   sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

namespace :public do
  get 'customers/check'
  get 'customers/my_page', to: 'customers#show', as: 'my_page'
end

namespace :admin do
  resources :customers, only: [:index, :show, :edit, :update]
  resources :items, only: [:new, :create, :index, :show, :edit, :update]
  end
end