class ApplicationController < ActionController::Base
    before_action :set_current_user

    # ログイン状態保存
    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    # 警告　"ログインが必要です"
    def authenicate_user
        if @current_user == nil
            flash[:notice] = "ログインが必要です"
            redirect_to("/users/login")
        end
    end
end
