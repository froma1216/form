class UsersController < ApplicationController
  # 「ログインユーザが存在するかどうか」チェック
  before_action :authenticate_user, { only: [:index, :show, :edit, :update] }
  # ログインユーザにアクセス制限をする
  before_action :forbid_login_user, { only: [:new, :create, :login_form, :login] }
  # ログインユーザと編集しようとしているユーザが正しいかチェック
  before_action :ensure_correct_user, { only: [:edit, :update] }

  # ユーザ一覧
  def index
    # usersテーブルの全データを取得
    @users = User.all
  end

  # ユーザ詳細
  def show
    # usersテーブルのidカラムが、ルーティングで指定した「:id」に対応するデータを取得
    @user = User.find_by(id: params[:id])
  end

  # ユーザ新規作成
  def new
    # Userインスタンスを作成し、変数@userに代入
    @user = User.new
  end

  # ユーザ編集
  def edit
    @user = User.find_by(id: params[:id])
  end

  # ユーザ新規作成：入力内容をDBに反映
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      # app/public/user_image/default_user.png
      image_name: "default_user.png",
      password: params[:password]
    )
    if @user.save
      # ログイン中のユーザーid
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      # rails7.0以降から、下記のように「status: :unprocessable_entity」の記載が必要。
      render("users/new", status: :unprocessable_entity)
    end
  end

  # ユーザ編集：入力内容をDBに反映
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    # 画像保存処理
    if params[:image]
      # 画像名は「ユーザid.jpg」
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      # 画像をpublic/user_imageフォルダに保存
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
    # 保存時の処理
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit", status: :unprocessable_entity)
    end
  end

  # ログイン
  def login_form; end

  # ログイン：アクション
  def login
    # 入力内容と一致するユーザーを取得し、変数@userに代入
    @user = User.find_by(email: params[:email])
    # ユーザが存在する かつ フォームから送信されたパスワードとハッシュ化されたパスワードが一致する
    if @user&.authenticate(params[:password])
      # sessionに、ログインに成功したユーザのidを代入
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/posts/index")
    else
      # エラーメッセージ
      @error_message = "メールアドレスまたはパスワードが間違っています"
      # 入力されたメールアドレス
      @email = params[:email]
      # 入力されたパスワード
      @password = params[:password]
      render("users/login_form", status: :unprocessable_entity)
    end
  end

  # ログアウト
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

  # いいね一覧
  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  # ログインユーザと編集しようとしているユーザが正しいかチェック
  def ensure_correct_user
    # .to_i…数値に変換
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
end
