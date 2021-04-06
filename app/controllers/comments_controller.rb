class CommentsController < ApplicationController
  def index
    @pref = params[:pref]
    @place = params[:place]
  end

  def create
    @pref = params[:pref]
    @place = params[:place]
    if @current_user
      @post_comment = Comment.new(post_id: params[:post_id], pref: @pref, place: @place, name: params[:name], comment: params[:comment])
    else
      @post_comment = Comment.new(post_id: params[:post_id], pref: @pref, place: @place, name: params[:name]+"(ゲスト)", comment: params[:comment])
    end
    @post_comment.save
    redirect_to("/posts/#{@pref}/#{@place}")
  end

  def destroy
    @post = Post.find_by(pref: params[:pref], place: params[:place])
    # @comment = User.find_by(post_id: @post.id, pref: params[:pref], place: params[:place], name: params[:name], comment: params[:comment])
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_to("/posts/#{params[:pref]}/#{params[:place]}")
  end
end
