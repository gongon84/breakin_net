class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update]
  
  def index
  end

  def show
    @user = User.find_by(id: params[:id])
    @post = Post.where(user_id: @user.id)
    @move = Move.where(user_id: @user.id)
    @like = Like.where(user_id: @user.id)
  end

  def table  # ユーザー検索ページ
    if params[:serch_user]
      @users = User.where('name LIKE ?', "%#{params[:serch_user]}%").page(params[:page]).per(5).order(updated_at: :desc)
    else
      @users = User.all.page(params[:page]).per(20).order(updated_at: :desc)
    end
  end
  
  def new  # 新規登録ページ
    # エラーメッセージで@userを使うため
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    logger.debug('createの中に入りました')
    if @user.save
      logger.debug('if文の中に入りました')
      UserMailer.activation_needed_email(@user).deliver_now
      redirect_to("/users/index", notice: 'メールを送信しました。そちらからログインください')
    else
      flash.now[:alert] = '登録に失敗しました'
      render 'users/new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = current_user
    if @user.update(user_profile_params)
      redirect_to("/users/#{@user.id}", notice: '編集しました')
    else
      render 'users/edit'
    end
  end

  # メール認証　アクション
  def activate
    # アクセストークンの認証
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(login_path, :notice => '登録が完了しました')
    else
      not_authenticated
    end
  end


  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation,
    )
  end

  def user_profile_params
    params.permit(
      :name,
      :profile,
      :url,
    )
  end
end
