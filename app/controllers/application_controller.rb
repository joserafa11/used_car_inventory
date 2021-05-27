class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery prepend: true

  protected 
  def check_admin
    if !current_user.is_admin?
      redirect_to "/errors"
    end
  end
  
end
