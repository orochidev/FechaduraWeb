class SessionsController < ApplicationController
  layout "login"
  before_action :block_access, except: [:destroy]



  def create
    @credencial = LoginSenha.find_by(login: params[:email].downcase)
    if @credencial && @credencial.authenticate(params[:password])
      sign_in(@credencial.pessoa)
      redirect_to salas_path
    else
        flash.now[:error] = ["Email/senha incorretos! Verifique as informações e tente novamente."]
        render 'new'
    end
  end

  def destroy
     sign_out
     redirect_to root_url
   end
end
