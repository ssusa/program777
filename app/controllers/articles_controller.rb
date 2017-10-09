#coding: utf-8
class ArticlesController < ApplicationController

  TK_TITLE1 = "Ruby on Railsでタスク管理を作ろう！"
  TK_YMD = [
    "20170926",
    "20170927",
    "20170930",
    "20171004",
    "20171005",
    "20171009",
    "99999999"
    ]
  TK_TITLE2 = [
    "事前準備",
    "作成するアプリの仕様",
    "railsプロジェクト作成",
    "データベース作成",
    "テストデータ作成",
    "ルーティングの設定",
    "次の記事はありません"
  ]

  def show
    if params[:yyyymm].present? && params[:yyyymmdd].present?
      index = TK_YMD.index(params[:yyyymmdd])
      @page_title1 = TK_TITLE1
      @page_title2 = TK_TITLE2[index]
      @page_title = @page_title1 + " " + @page_title2
      @next_page_url = "/articles/" + TK_YMD[index+1][0..5] + "/" + TK_YMD[index+1]
      @next_page_title = TK_TITLE2[index+1]

      render "articles/" + TK_YMD[index][0..5] + "/" + TK_YMD[index]
    else
      redirect_to root_path
    end
  end
end