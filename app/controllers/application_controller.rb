class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = '小B 你不是老板'
      redirect_to root_path
    end
  end
end
