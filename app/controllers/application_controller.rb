class ApplicationController < ActionController::Base
  before_action :set_current_user

  # ログイン中のユーザを特定
  def set_current_user
    # 現在ログイン中のユーザーを取得し、変数current_userに代入
    @current_user = User.find_by(id: session[:user_id])
  end

  # 「ログインユーザが存在するかどうか」チェック
  def authenticate_user
    if @current_user.nil?
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end

  # ログインユーザにアクセス制限をする
  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to("/posts/index")
    end
  end
end
