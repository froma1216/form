class PawapuroController < ApplicationController
  # 選手一覧画面
  def index
    @hit_player = PawapuroPlayer.all
  end

  # 選手作成入力画面
  def new; end

  # 選手作成確認画面
  def confirm
    # @pawapuro = Pawapuro.new(pawapuro_params)
    # if @pawapuro.valid?
    #   render :confirm
    # else
    #   render :new
    # end
  end

  # 選手情報編集画面
  def edit; end

  private

  def pawapuro_params
    # 必要なパラメータをここに記載
  end
end
