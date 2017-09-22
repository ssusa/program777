#coding: utf-8
module Samples::TaskKanri::TasksHelper
  def sample_task_kanri_kanryo_str(kanryo)
    if kanryo == true
      "完了"
    else
      "未完了"
    end
  end

  def kigen_format(kigen)
    result = ""
    if kigen.present?
      result = kigen.strftime("%Y/%m/%d")
    end
    result
  end
end
