class PostsController < ApplicationController
  # 「ログインユーザが存在するかどうか」チェック
  before_action :authenticate_user
  # ログインユーザ以外はurl遷移できないように
  before_action :ensure_correct_user, { only: [:edit, :update, :destroy] }

  # 投稿一覧
  def index
    # DB:postsテーブルの全データ（作成日順で降順でソート）
    @posts = Post.all.order(created_at: :desc)
  end

  # 投稿詳細
  def show
    # postsテーブルのidカラムが、ルーティングで指定した「:id」に対応するデータを取得
    @post = Post.find_by(id: params[:id])
    # 対応するユーザ情報を取得（モデル：post.rbで定義）
    @user = @post.user
    # 対応するいいねの数
    @likes_count = Like.where(post_id: @post.id).count
  end

  # 新規投稿
  def new
    @post = Post.new
  end

  # 投稿編集
  def edit
    @post = Post.find_by(id: params[:id])
  end

  # 投稿データ作成
  def create
    # DBにデータ作成
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id
    )
    if @post.save
      # サクセスメッセージ
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new", status: :unprocessable_entity)
    end
  end

  # 投稿編集内容をDBに反映
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    # 保存の成功失敗によって、遷移先を分ける
    if @post.save
      # サクセスメッセージ
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      # editアクションを経由せず、posts/edit.html.erbを表示する
      # rails7.0以降から、下記のように「status: :unprocessable_entity」の記載が必要。
      render("posts/edit", status: :unprocessable_entity)
    end
  end

  # 投稿削除
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    # サクセスメッセージ
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end

  # ログインユーザ以外はurl遷移できないように
  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
end
