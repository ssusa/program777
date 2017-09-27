#coding: utf-8
class ArticlesController < ApplicationController
  def show
    render "articles/" + params[:yyyymm] + "/" + params[:yyyymmdd]
  end
end
