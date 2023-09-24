class LikesController < ApplicationController
  # 「ログインユーザが存在するかどうか」チェック
  before_action :authenticate_user

  #  いいね新規作成
  def create
    @like = Like.new(user_id: @current_user.id, post_id: params[:post_id])
    @like.save
    redirect_to("/posts/#{params[:post_id]}")
  end

  # いいね削除
  def destroy
    @like = Like.find_by(user_id: @current_user.id, post_id: params[:post_id])
    @like.destroy
    redirect_to("/posts/#{params[:post_id]}")
  end
end
