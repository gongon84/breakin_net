class UsersController < ApplicationController

  before_action :authenicate_user, {only: [:edit, :update]}

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @post = Post.where(user_id: @user.id)
    @move = Move.where(user_id: @user.id)
    @like = Like.where(user_id: @user.id)
  end

  def table
    if params[:serch_user]
      @users = User.where('name LIKE ?', "%#{params[:serch_user]}%").page(params[:page]).per(5).order(updated_at: :desc)
    else
      @users = User.all.page(params[:page]).per(20).order(updated_at: :desc)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], profile: "よろしくお願いします")
    if @user.save
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}", notice: "ユーザー登録が完了しました")
    else
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.url = params[:url]
    @user.profile = params[:profile]
    if @user.save
      redirect_to("/users/#{@user.id}", notice: "編集が完了しました")
    else
      render("users/edit")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}", notice: "ログインしました")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to("/users/index", notice: "ログアウトしました")
  end
end
