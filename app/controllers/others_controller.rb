#coding: utf-8
class OthersController < ApplicationController
  def about
    render "about"
  end

  def toiawase
    render "toiawase"
  end

  def toiawase_send_mail
    ToiawaseMailer.toiawase(params[:namae],params[:mail_address],params[:naiyo]).deliver
    redirect_to root_path
  end
end
