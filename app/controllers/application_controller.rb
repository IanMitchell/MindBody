class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :new_location

  private

  def new_location
    if user_signed_in?
      @new_location = Location.new
    end
  end
end
