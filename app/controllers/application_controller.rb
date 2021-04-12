class ApplicationController < ActionController::Base
    # require_loginが発動したとき、警告する
    def not_authenticated
        redirect_to login_path, alert: "ログインが必要です"
    end


    # before_action :set_current_user

    # # ログイン状態保存
    # def set_current_user
    #     @current_user = User.find_by(id: session[:user_id])
    # end
end
