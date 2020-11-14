Rails.application.routes.draw do
  get '/' => "home#top"
  get "/about" => "home#about"
  get "/test" => "home#test"
  get "/wait" => "home#wait"

  # ポスト投稿
  get '/posts/index' => "posts#index"
  get '/posts/:pref' => "posts#table"
  get "/posts/:pref/new" => "posts#new"
  post "/posts/create" => "posts#create"
  get "/posts/:pref/:place" => "posts#show"
  get "/posts/:pref/:place/edit" => "posts#edit"
  post "/posts/update" => "posts#update"
  post "/posts/:pref/:place/destroy" => "posts#destroy"
  # 画像
  get "/posts/:pref/:place/editImage" => "posts#editImage"
  post "/posts/updateImage" => "posts#updateImage"
  post "/posts/:pref/:place/defaultImage" => "posts#defaultImage"
  # コメント
  get "/comment/:pref/:place" => "comments#index"
  post "/comments/create" => "comments#create"
  post "/comments/:pref/:place/:id/destroy" => "comments#destroy"

  # ユーザー
  get 'users/index' => "users#index"
  get 'users/signup' => "users#new"
  get "users/table" => "users#table"
  get "users/login" => "users#login_form"
  post "users/login" => "users#login"
  post "users/logout" => "users#logout"
  get "users/:id" => "users#show"
  post 'users/create' => "users#create"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"

  root "home#top"
end
