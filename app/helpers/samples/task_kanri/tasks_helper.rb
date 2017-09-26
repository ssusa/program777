#coding: utf-8
module Samples::TaskKanri::TasksHelper
  def sample_task_kanri_kanryo_tag(task)
    result = ""
    if task.kanryo == true
      result = '済'
    else
      result = '<a class="btn btn-sm btn-primary" href="' + kanryo_samples_task_kanri_task_path(task) + '">完了</a>'
    end
    result.html_safe
  end

  def kigen_format(kigen)
    result = ""
    if kigen.present?
      result = kigen.strftime("%Y/%m/%d")
    end
    result
  end
end
