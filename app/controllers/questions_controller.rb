class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @user = User.find_by(id: session[:user_id])
  end

  def create
    if @current_user
      @comment = Question.new(user_id: params[:user_id], name: params[:name], comment: params[:comment])
    else
      @comment = Question.new(name: params[:name]+"(ゲスト)", comment: params[:comment])
    end
    @comment.save
    redirect_to("/questions/index")
  end

  def destroy
    @comment = Question.find_by(id: params[:id])
    @comment.destroy
    redirect_to("/questions/index")
  end
end
