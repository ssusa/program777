#coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :default_before_filter

  def default_before_filter

    @const_site_title = "program777"
    @twitter_image_url = "https://images.program777.com/program.jpg"
    @description = "ruby on railsのサンプルプログラムの作成手順を初心者でもわかるように1から解説しています"
    @keyword = "ruby on rails,サンプル"

    #タイトルとツイッタータイトルになるため、上書きしないとだめ。
    @page_title = "Railsでタスク管理を作ろう！ 事前準備"

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
