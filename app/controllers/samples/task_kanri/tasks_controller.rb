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

    @task = SamplesTaskKanriTask.new(task_params)
    @task.kigen = to_date_from_ymd(@task.kigen_str)
    @kanryo = false
    @task.save

    flash[:notice] = "登録しました。"
    redirect_to samples_task_kanri_tasks_path

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

  #ストロングパラメータ（マスアサインメント脆弱性回避）
  def task_params
    params.require(:samples_task_kanri_task).permit(
      :name,
      :shosai,
      :kigen_str
    )
  end

  def to_date_from_ymd(ymd)
    result = nil
    begin
      result = Date.new(ymd[0..3].to_i, ymd[4..5].to_i, ymd[6..7].to_i)
      byebug
    rescue
      result = nil
    end
    result
  end
end
