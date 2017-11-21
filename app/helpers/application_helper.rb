module ApplicationHelper

  def current_user
    @current_user ||= Pessoa.find_by(id: session[:user_id])
   end


end
