#coding: utf-8
class ArticlesController < ApplicationController
  def show
    if params[:yyyymm].present? && params[:yyyymmdd].present?
      #これをどうにかしたい
      if params[:yyyymmdd] == "20170926"
        @page_title = "1.事前準備 railsタスク管理"
      elsif params[:yyyymmdd] == "20170927"
        @page_title = "2.作成するアプリの仕様 railsタスク管理"
      end
      render "articles/" + params[:yyyymm] + "/" + params[:yyyymmdd]
    else
      #デフォルト
      @page_title = "1.事前準備 railsタスク管理"
      render "articles/201709/20170926"
    end
  end
end
