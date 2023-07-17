Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in...
#  devise_for :customers,skip: [:passwords], controllers: {
#    registrations: "public/registrations",
#    sessions: 'public/sessions'
#  }
 root to: "items#new"  # Topページを設定
# 管理者用
# URL /admin/sign_in ...
#  devise_for :admin,skip: [:registrations, :passwords], controllers: {
 #   sessions: "admin/sessions"
#  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

get 'top' => 'items#new'
get /admin 
  # resourcesは、itemsコントローラに紐づいたアクションをまとめて指定できる（商品機能用）
  resources :items, only: [:new, :create, :index]
end
