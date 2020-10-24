Rails.application.routes.draw do
  get 'user/index'
  get '/' => "home#top"
  get "/about" => "home#about"
  get "/test" => "home#test"

  get '/posts/index' => "posts#index"
  get '/posts/:pref' => "posts#table"
  get "/posts/:pref/new" => "posts#new"
  post "/posts/create" => "posts#create"
  get "/posts/:pref/:place" => "posts#show"
  get "/posts/:pref/:place/edit" => "posts#edit"
  post "/posts/update" => "posts#update"
  post "/posts/:pref/:place/destroy" => "posts#destroy"
  # テスト　検索
  # post "/posts/serch" => "posts#serch"

  get "/comment/:pref/:place" => "user#index"
  post "/user/create" => "user#create"
  post "/user/:pref/:place/:id/destroy" => "user#destroy"

  root "home#top"
end
