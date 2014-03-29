class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 # protect_from_forgery with: :exception
  def is_logged
    if session[:user_id].nil?
      flash[:error] = "Nemate prava pristupa!"
      redirect_to root_path, :notice => "Niste ulogovani"
    end
  end
end
