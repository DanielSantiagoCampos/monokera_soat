class InfoMailer < ApplicationMailer

  def new_info_email
    puts "#" * 100
    puts params[:info]
    puts "#" * 100
    @info = params[:info]
    @to = params[:to]
    mail(to: @to, subject: "Compraste tu SOAT")
  end

end
