class ApplicationController < ActionController::Base
  add_flash_types :error, :success

  include SessionsHelper
  def authorize
     unless logged_in?
       redirect_to root_url
     end
  end


end
