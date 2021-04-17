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

  # 交流の場
  get 'questions/index' => "questions#index"
  post 'questions/create' => "questions#create"
  post 'questions/:id/destroy' => "questions#destroy"

  # レッスン
  get 'lessons/index' => "lessons#index"
  get '/lessons/:pref' => "lessons#table"
  get '/lessons/:pref/new' => "lessons#new"
  post '/lessons/create' => "lessons#create"
  get "/lessons/:pref/:place" => "lessons#show"
  get 'lessons/:pref/:place/edit' => "lessons#edit"
  post 'lessons/update' => "lessons#update"
  post '/lessons/:pref/:place/destroy' => "lessons#destroy"

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

  # ユーザー　sorcery
  get 'users/index' => "users#index"
  get 'users/table' => "users#table"
  get '/users/new' => "users#new"
  post '/users/create' => "users#create"
  get '/users/:id' => "users#show"
  get "users/:id/edit" => "users#edit"
  post 'users/update' => "users#update"

   # user_sessions
   get '/login' => 'user_sessions#new'
   post '/login' => 'user_sessions#create'
   post '/logout' => 'user_sessions#destroy'
   post '/guest_login' => 'user_sessions#guest_login'

  # ムーブ
  get 'moves/index' => "moves#index"
  get "moves/new" => "moves#new"
  post "moves/create" => "moves#create"
  post "moves/skill_create" => "moves#skill_create"
  post "moves/limit_create" => "moves#limit_create"
  post "moves/update" => "moves#update"
  post "moves/:user_id/:title/destroy" => "moves#destroy"
  post "moves/:user_id/:title/:skill/skill_destroy" => "moves#skill_destroy"
  post "moves/:user_id/:title/:limit/limit_destroy" => "moves#limit_destroy"
  get "/moves/:user_id/:title/show" => "moves#show"
  get "/moves/:user_id/:title/edit" => "moves#edit"

  # いいね
  get 'likes/index' => "likes#index"
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  # マップ
  get "maps/index" => "maps#index"

  root "home#top"

  # メール認証　acrivate呼び出し
  resources :users do
    member do
      get :activate
    end
  end

  # letter_opener_webの使用 下記のURLで確認できる
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
