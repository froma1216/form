class EFrontierController < ApplicationController
  # エメラルド：バトルフロンティア
  def index
    @hit_pokemon = []
  end

  # 検索ボタン押下
  def search
    @hit_pokemon = if params[:name].present?
                     EFrontierAll.search(params[:name], params[:lap])
                   else
                     []
                   end

    respond_to do |format|
      format.html { render "index" }
      format.js
    end
    # render :search
  end
end
