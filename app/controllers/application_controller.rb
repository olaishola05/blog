class ApplicationController < ActionController::Base
  add_flash_types :success, :error

  def current_user
    User.first
  end
  helper_method :current_user
end
