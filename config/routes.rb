Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  get '/' => 'public/homes#top'
  get '/about' => 'public/homes#about'

# 管理者用
# URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  get '/admin' => 'admin/homes#top'

end
