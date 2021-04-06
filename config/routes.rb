Rails.application.routes.draw do

  get '/' => "home#top"
  get "/about" => "home#about"
  get "/about/lesson" => "home#lesson"
  get "/about/place" => "home#place"
  get "/about/move" => "home#move"
  get "/about/account" => "home#account"
  get "/about/question" => "home#question"
  get "/main" => "home#main"
  get "/test" => "home#test"
  get "/wait" => "home#wait"

  # 質問スレッド
  get 'questions/index' => "questions#index"
  post 'questions/create' => "questions#create"
  post 'questions/:id/destroy' => "questions#destroy"

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

  # ムーブ
  get 'moves/index' => "moves#index"
  get "moves/new" => "moves#new"
  post "moves/create" => "moves#create"
  post "moves/skill_create" => "moves#skill_create"
  post "moves/limit_create" => "moves#limit_create"
  post "moves/update" => "moves#update"
  post "moves/:user_id/:title/destroy" => "moves#destroy"
  get "/moves/:user_id/:title/show" => "moves#show"
  get "/moves/:user_id/:title/edit" => "moves#edit"

  # いいね
  get 'likes/index' => "likes#index"
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  # マップ
  get "maps/index" => "maps#index"

  root "home#top"
end
