class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :admin_signed_in?



end
