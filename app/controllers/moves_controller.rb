class MovesController < ApplicationController
  before_action :require_login, only: [:new, :create, :skill_create, :limit_create]

  def index
    @move = Move.all.order(updated_at: :desc)
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @move = Move.find_by(user_id: params[:user_id], title: params[:title])
    @move_skill = Move.where(user_id: params[:user_id], title: params[:title])
  end

  def new
    @user = User.find_by(id: session[:user_id])
  end

  def create
    @move = Move.new(user_id: params[:user_id], title: params[:title], skill: "チェアー", limit: "ノーマル")
    if @move.save
      redirect_to("/moves/index")
    else
      render("/moves#new")
    end
  end

  def destroy
    @move = Move.where(user_id: params[:user_id], title: params[:title])
    if @move.destroy_all
      redirect_to("/moves/index", notice: "削除しました")
    else
      redirect_to("/moves/index", notice: "削除に失敗しました")
    end
  end

  def skill_create
    @move = Move.new(user_id: params[:user_id], title: params[:title], skill: params[:skill])
    @move_skill = Move.where(user_id: params[:user_id], title: params[:title])
    flash[:alert] = []
    unless @move.save
      flash[:alert] << "#{@move.skill}はすでに存在しています"
    end
    unless params[:skill2].empty?
      @move2 = Move.new(user_id: params[:user_id], title: params[:title], skill: params[:skill2])
      unless @move2.save
        flash[:alert] << "#{@move2.skill}はすでに存在しています"
      end
    end
    unless params[:skill3].empty?
      @move3 = Move.new(user_id: params[:user_id], title: params[:title], skill: params[:skill3])
      unless @move3.save
        flash[:alert] << "#{@move3.skill}はすでに存在しています"
      end
    end
    redirect_to("/moves/#{@move.user_id}/#{@move.title}/show")
  end

  def limit_create
    @move = Move.new(user_id: params[:user_id], title: params[:title], limit: params[:limit])
    flash[:alert] = []
    unless @move.save
      flash[:alert] << "#{@move.limit}はすでに存在しています"
    end
    unless params[:limit2].empty?
      @move2 = Move.new(user_id: params[:user_id], title: params[:title], limit: params[:limit2])
      unless @move2.save
        flash[:alert] << "#{@move2.limit}はすでに存在しています"
      end
    end
    unless params[:limit3].empty?
      @move3 = Move.new(user_id: params[:user_id], title: params[:title], limit: params[:limit3])
      unless @move3.save
        flash[:alert] << "#{@move3.limit}はすでに存在しています"
      end
    end
    redirect_to("/moves/#{@move.user_id}/#{@move.title}/show")
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @move = Move.find_by(user_id: params[:user_id], title: params[:title])
  end

  def update
    Move.where(user_id: params[:user_id], title: params[:title]).update_all(title: params[:new_title])
    redirect_to("/moves/#{params[:user_id]}/#{params[:new_title]}/show")
  end
end
