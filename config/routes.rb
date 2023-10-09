Rails.application.routes.draw do
  # TODO: 総見直し
  # home
  root "home#top"
  get "about", to: "home#about"
  
  # パワプロ：選手作成メモ
  resources :pawapuro, except: [:destroy] do
    member do
    end
  end

  # エメラルドバトルフロンティア
  get "e_frontier", to: "e_frontier#index"
  get "e_frontier_search", to: "e_frontier#search"
  # resources :e_frontier, except: [:destroy] do
  #   collection do
  #     get :search # 全てのユーザに対する検索機能
  #   end
  # end

  # いいね
  resources :likes, only: [:create, :destroy], param: :post_id

  # ユーザ関連
  # （index, new, create, show, edit, update, destroy）
  # resourceのイメージは下記の通り
  # GET    /users          => users#index
  # GET    /users/new      => users#new
  # POST   /users          => users#create
  # GET    /users/:id      => users#show（user_path(@current_user)）
  # GET    /users/:id/edit => users#edit
  # PATCH  /users/:id      => users#update
  # PUT    /users/:id      => users#update
  # DELETE /users/:id      => users#destroy
  resources :users, except: [:destroy] do
    member do
      get :likes
      get :edit # ユーザ編集
      post :update # ユーザ変数のアクション
    end
  end

  # 投稿関連
  resources :posts, except: [:destroy] do
    member do
      get :edit # 投稿編集
      post :update # 投稿編集のアクション
      post :destroy # 投稿削除
    end
  end

  # ログイン、ログアウト、サインアップ
  get "login", to: "users#login_form"
  post "login", to: "users#login"
  post "logout", to: "users#logout"
  get "signup", to: "users#new"
end
