class SessionController < ApplicationController
  def new
    user = User.new
    render("new.slang")
  end

  def create
    user = User.find_by(email: params["email"].to_s)
    if user && user.authenticate(params["password"].to_s)
      session[:user_id] = user.id
      flash[:info] = "Logueado exitosamente"
      redirect_to "/"
    else
      flash[:danger] = "Email o contraseña invalida"
      user = User.new
      render("new.slang")
    end
  end

  def delete
    session.delete(:user_id)
    flash[:info] = "Desconectado. ¡Te veo luego!"
    redirect_to "/"
  end
end
