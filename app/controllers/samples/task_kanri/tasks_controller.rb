#coding: utf-8
class Samples::TaskKanri::TasksController < ApplicationController

  layout "/samples/task_kanri/application"

  #一覧画面 表示のアクション
  def index
    @tasks = SamplesTaskKanriTask
              .by_kanryo(params[:kanryo])
              .paginate(page: params[:page], per_page: 5).order('kanryo asc, kigen asc')

    @grid_no = 1
    if params[:page].present?
      @grid_no = (params[:page].to_i - 1) * 5 + 1
    end
  end

  #照会画面 表示のアクション
  def show
    begin
      @task = SamplesTaskKanriTask.find(params[:id])
      render "show"
    rescue ActiveRecord::RecordNotFound
      redirect_to samples_task_kanri_tasks_path
    end
  end

  #新規登録画面 表示のアクション
  def new
    @task = SamplesTaskKanriTask.new
  end

  #編集画面 表示のアクション
  def edit
    begin
      @task = SamplesTaskKanriTask.find(params[:id])
      if @task.kigen.present?
        @task.kigen_str = @task.kigen.strftime("%Y%m%d")
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to samples_task_kanri_tasks_path
    end
  end

  #新規登録画面 登録ボタン押下時のアクション
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

  #編集画面 更新ボタン押下時のアクション
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

  #一覧画面 削除ボタン押下時のアクション
  def destroy
    @task = SamplesTaskKanriTask.find(params[:id])
    @task.destroy
    flash[:msg] = "削除しました。"
    redirect_to request.referer
  end

  #一覧画面 完了ボタン押下時のアクション
  def kanryo
    @task = SamplesTaskKanriTask.find(params[:id])
    @task.kanryo = true
    @task.save
    redirect_to request.referer
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
