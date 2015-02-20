class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_login

  def check_login
    json_request = request.format == 'json'
    unless json_request
      login = cookies[:login]

      if login
        @active_user = Usuario.find(login)
        redirect_to login_path unless @active_user.ativo? or request.original_url == login_url
        cookies[:login] = {value: @active_user.id, expires: Time.now + 900}
      else
        redirect_to login_path unless request.original_url == login_url
      end
    end
  end

  def current_user
    @active_user
  end

end
