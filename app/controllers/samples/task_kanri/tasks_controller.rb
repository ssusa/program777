#coding: utf-8
class Samples::TaskKanri::TasksController < ApplicationController

  layout "/samples/task_kanri/application"

  #リスト表示
  def index
    @tasks = SamplesTaskKanriTask
              .by_kanryo(params[:kanryo])
              .paginate(page: params[:page], per_page: 5).order('kigen asc')

    @grid_no = 1
    if params[:page].present?
      @grid_no = (params[:page].to_i - 1) * 5 + 1
    end
  end

  #新規フォーム表示
  def new
    @task = SamplesTaskKanriTask.new
  end

  #新規データ作成
  def create

  end

  #編集フォーム表示
  def edit

  end

  #編集データ更新
  def update

  end

  #データ表示
  def show

  end

  #データ削除
  def destroy

  end

  private

  def task_params
    params.require(:task).permit(
      :name,
      :shosai,
      :kigen
    )
  end
end
