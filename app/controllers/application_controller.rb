#coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :default_before_filter

  def default_before_filter

    @const_site_title = "program777"
    @description = "ITの基礎知識からプログラムの書き方まで紹介"
    @keyword = "html,C#,ruby on rails"

    @render_mode = "pc"
    if params[:render_mode].present?
      @render_mode = params[:render_mode]
    elsif request.user_agent.index("iPhone").present?
      @render_mode = "sp"
    elsif request.user_agent.index("iPod").present?
      @render_mode = "sp"
    elsif request.user_agent.index("iPad").present?
      @render_mode = "tb"
    elsif request.user_agent.index("Android").present?
      if request.user_agent.index("Mobile").present?
        @render_mode = "sp"
      else
        @render_mode = "tb"
      end
    end

  end
end
