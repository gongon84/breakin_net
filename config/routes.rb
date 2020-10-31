Rails.application.routes.draw do
  get 'users/index'
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
  # 画像
  get "/posts/:pref/:place/editImage" => "posts#editImage"
  post "/posts/updateImage" => "posts#updateImage"
  post "/posts/:pref/:place/defaultImage" => "posts#defaultImage"
  # コメント
  get "/comment/:pref/:place" => "comments#index"
  post "/comments/create" => "comments#create"
  post "/comments/:pref/:place/:id/destroy" => "comments#destroy"

  root "home#top"
end
