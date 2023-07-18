Rails.application.routes.draw do
  get '/' => 'public/homes#top'
  get '/about' => 'public/homes#about'
  get '/admin' => 'admin/homes#top'

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

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end




end