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
    if @task.valid?
      if @task.kigen_str.present?
        @task.kigen = Date.new(
          @task.kigen_str[0..3].to_i,
          @task.kigen_str[4..5].to_i,
          @task.kigen_str[6..7].to_i)
      end
      @task.kanryo = false
      @task.save(validate:false)

      flash[:msg] = "登録しました。"
      redirect_to samples_task_kanri_tasks_path
    else
      render "new"
    end
  end

  #編集フォーム表示
  def edit
    @task = SamplesTaskKanriTask.find(params[:id])
    if @task.kigen.present?
      @task.kigen_str = @task.kigen.strftime("%Y%m%d")
    end
  end

  #編集データ更新
  def update
    @task = SamplesTaskKanriTask.find(params[:id])
    @task.assign_attributes(task_params)
    if @task.valid?
      if @task.kigen_str.present?
        @task.kigen = Date.new(
          @task.kigen_str[0..3].to_i,
          @task.kigen_str[4..5].to_i,
          @task.kigen_str[6..7].to_i)
      end
      @task.save(validate:false)

      flash[:msg] = "編集しました。"
      redirect_to samples_task_kanri_tasks_path
    else
      render "edit"
    end
  end

  #データ表示
  def show

  end

  #データ削除
  def destroy
    @task = SamplesTaskKanriTask.find(params[:id])
    @task.destroy
    flash[:msg] = "削除しました。"
    redirect_to samples_task_kanri_tasks_path
  end

  #------------------------------------------------------------------------------
  private
  #------------------------------------------------------------------------------

  #ストロングパラメータ（マスアサインメント脆弱性回避）
  def task_params
    params.require(:samples_task_kanri_task).permit(
      :name,
      :shosai,
      :kigen_str
    )
  end
end
