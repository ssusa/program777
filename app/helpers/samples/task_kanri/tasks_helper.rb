#coding: utf-8
module Samples::TaskKanri::TasksHelper
  def sample_task_kanri_kanryo_str(task)
    if task.kanryo == true
      "完了"
    else
      "未完了"
    end
  end
end
