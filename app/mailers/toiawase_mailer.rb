#coding: utf-8
class ToiawaseMailer < ApplicationMailer

  default from: "mytokyo777@gmail.com"

  def toiawase(namae, mail_address, naiyo)

    @namae = namae
    @mail_address = mail_address
    @naiyo = naiyo

    mail(to: "mytokyo777@gmail.com",
         subject: "my-tokyo:問い合わせメール"
    )

  end

end
