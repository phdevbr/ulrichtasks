class AuthController < ApplicationController
  before_action :check_logged, only: %i[new create]

  def new; end

  def create
    user = User.find_by(username: params[:username])
    if user && user.password == params[:password]
      cookies.permanent[:user_id] = user.id
      redirect_to root_path, notice: 'Login efetuado com sucesso!'
    else
      flash[:alert] = 'Usuario ou senha inválidos'
      redirect_to login_path
    end
  end

  private

  def check_logged
    user_logged_in = cookies[:user_id]
    redirect_to root_path, notice: 'You are already logged in.' if user_logged_in
  end
end
