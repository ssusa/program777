#coding: utf-8
module ApplicationHelper
  def render_pc_url(request_path)
    result = request_path
    if !request_path.index("render_mode=pc").present?
      if request_path.index("?").present?
        result = request_path + "&render_mode=pc"
      else
        result = request_path + "?render_mode=pc"
      end
    end
    result
  end
end
