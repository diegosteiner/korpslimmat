class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :view_options
  def view_options options={}
    @view_options ||= {
        single_page: false,
    }
    @view_options.merge! options
  end
end
