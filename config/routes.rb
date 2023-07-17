Rails.application.routes.draw do

# 顧客用
  root 'public/homes#top'
  get '/about' => 'public/homes#about'

# URL /customers/sign_in...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


# 管理者用
  get '/admin' => 'admin/homes#top'
  get '/admin/genres' => 'admin/genres#index'
# URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

end
