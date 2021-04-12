class UserSessionsController < ApplicationController
    def new
    end
  
    def create
      if @user = login(params[:email], params[:password])
        redirect_back_or_to("/users/#{@user.id}", notice: 'ログインしました')
      else
        flash[:alert] = 'ログインに失敗しました'
        # @error_message = "メールアドレスまたはパスワードが間違っています"
        render 'user_sessions/new'
      end
    end
  
    def destroy
      logout
      redirect_to('/users/index', notice: 'ログアウトしました')
    end
end
