#coding: utf-8
class ArticlesController < ApplicationController
  def show
    if params[:yyyymm].present? && params[:yyyymmdd].present?
      @page_title1 = "Ruby on Railsでタスク管理を作ろう！"
      @page_title2 = ""
      if params[:yyyymmdd] == "20170926"
        @page_title2 = "事前準備"
      elsif params[:yyyymmdd] == "20170927"
        @page_title2 = "作成するアプリの仕様"
      elsif params[:yyyymmdd] == "20170930"
        @page_title2 = "railsプロジェクト作成"
      elsif params[:yyyymmdd] == "20171004"
        @page_title2 = "データベース作成"
      elsif params[:yyyymmdd] == "20171005"
        @page_title2 = "テストデータ作成"
      end
      @page_title = @page_title1 + " " + @page_title2
      render "articles/" + params[:yyyymm] + "/" + params[:yyyymmdd]
    else
      redirect_to root_path
    end
  end
end
