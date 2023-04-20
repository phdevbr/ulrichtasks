class AuthController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:username])
    redirect_to root_path, notice: 'email: ' + params[:username] + 'user_id:' + user.id
    # if user && user.password == params[:password]
    #   cookies[:user_id] = user.id
    #   redirect_to root_path, notice: 'Login efetuado com sucesso!'
    # else
    #   flash.now[:alert] = 'E-mail ou senha inválidos'
    #   render :new
    # end
  end
end
