class LikesController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

  def index
  end

  def create
    @like = Like.new(
      user_id: @current_user.id,
      post_id: params[:post_id]
    )
    if @like.save
      # 直前のページに戻る
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path, notice: "いいねに失敗しました")
    end
  end

  def destroy
    @like = Like.find_by(user_id: @current_user.id, post_id: params[:post_id])
    if @like.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path, notice: "解除に失敗しました")
    end
  end
end