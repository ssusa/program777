#coding: utf-8
class ArticlesController < ApplicationController

  def show
    if params[:yyyymm].present? && params[:yyyymmdd].present?
      index = Const::TK_YMD.index(params[:yyyymmdd])
      @page_title1 = Const::TK_TITLE1
      @page_title2 = Const::TK_TITLE2[index]
      @page_title = @page_title1 + " " + @page_title2
      @next_page_url = "/articles/" + Const::TK_YMD[index+1][0..5] + "/" + Const::TK_YMD[index+1]
      @next_page_title = Const::TK_TITLE2[index+1]

      render "articles/" + Const::TK_YMD[index][0..5] + "/" + Const::TK_YMD[index]
    else
      redirect_to root_path
    end
  end
end