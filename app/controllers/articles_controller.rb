#coding: utf-8
class ArticlesController < ApplicationController
  def show
    if params[:yyyymm].present? && params[:yyyymmdd].present?
      #これをどうにかしたい
      if params[:yyyymmdd] == "20170926"
        @page_title = "Ruby on Railsでタスク管理を作ろう！ 事前準備"
      elsif params[:yyyymmdd] == "20170927"
        @page_title = "Ruby on Railsでタスク管理を作ろう！ 作成するアプリの仕様"
      elsif params[:yyyymmdd] == "20170930"
        @page_title = "Ruby on Railsでタスク管理を作ろう！ railsプロジェクト作成"
      elsif params[:yyyymmdd] == "20171004"
        @page_title = "Ruby on Railsでタスク管理を作ろう！ データベース作成"
      elsif params[:yyyymmdd] == "20171005"
        @page_title = "Ruby on Railsでタスク管理を作ろう！ テストデータ作成"
      end
      render "articles/" + params[:yyyymm] + "/" + params[:yyyymmdd]
    else
      #デフォルト
      @page_title = "Railsでタスク管理を作ろう！ 事前準備"
      render "articles/201709/20170926"
    end
  end
end
