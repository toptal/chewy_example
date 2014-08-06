class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  around_action :chewy_block
  
  def chewy_atomic
    Chewy.atomic do
      yield
    end
  end
end
