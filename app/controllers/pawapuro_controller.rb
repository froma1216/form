class PawapuroController < ApplicationController
  # 選手一覧画面
  def index
    @players = PawapuroPlayer.all
  end

  # 選手詳細モーダル
  def details
    @player = PawapuroPlayer.find(params[:id])
    respond_to do |format|
      format.js # JavaScriptレスポンスを期待
      format.html # TODO: 暫定処置。非同期で上記が表示できるようになったら消す。
    end
  end

  # 選手作成入力画面
  def new
    @player = PawapuroPlayer.new
    @player.build_pawapuro_pitcher
    @player.build_pawapuro_fielder
    # @pitcher = PawapuroPitcher.new
    # @pfielder = PawapuroFielder.new
  end

  # 選手情報編集画面
  def edit
    @player = PawapuroPlayer.find(params[:id])
    # @pitcher = PawapuroPitcher.find(params[:id])
    # @pfielder = PawapuroFielder.find(params[:id])
  end

  # 選手作成アクション
  def create
    @player = PawapuroPlayer.new(player_params)
    # @pitcher = PawapuroPitcher.new(pitcher_params)
    # @pfielder = PawapuroFielder.new(fielder_params)
    if @player.save
      # 成功時の処理（例：リダイレクト）
      # redirect_to some_path, notice: 'Player was successfully created.'
      redirect_to pawapuro_index_path
    else
      # 失敗時の処理
      render :new
    end
  end

  # 選手編集アクション
  def update
    @player = PawapuroPlayer.find(params[:id])
    if @player.update(player_params)
      # 成功時の処理
      # redirect_to some_other_path, notice: 'Player was successfully updated.'
      redirect_to pawapuro_index_path
    else
      # 失敗時の処理
      render :edit
    end
    # @pitcher = PawapuroPitcher.find(params[:id])
    # @pfielder = PawapuroFielder.find(params[:id])
  end

  # 選手作成確認画面
  def confirm
    # @pawapuro = Pawapuro.new(pawapuro_params)
    # if @pawapuro.valid?
    #   render :confirm
    # else
    #   render :new
    # end
  end

  private

  def player_params
    params.require(:pawapuro_player).permit(
      :last_name, :first_name, :player_name, :back_name, :birthday, :throws, :bats, :main_position, :sub_position_2, :sub_position_3, :sub_position_4, :sub_position_5, :sub_position_6, :sub_position_7, :kaifuku, :kegasinikusa, :note,
      pawapuro_pitcher_attributes: [:id, :starter_proper, :reliever_proper, :closer_proper, :pace, :control, :stamina, :taipinch, :taihidaridasya, :utarezuyosa, :nobi, :quick],
      pawapuro_fielder_attributes: [:id, :trajectory, :meat, :power, :running, :arm_strength, :defense, :catching, :chance, :taihidaritousyu, :catcher, :tourui, :sourui, :soukyuu]
    )
  end
  # def pitcher_params
  #   pramas.requier(:pitcher).permit(:pace)
  # end
  # def fielder_params
  #   pramas.requier(:fielder).permit(:meat)
  # end
end
