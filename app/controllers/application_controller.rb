class ApplicationController < ActionController::Base
  skip_forgery_protection
  before_action :authenticate_user!,  {:alert => "You need to sign in or sign up before continuing."}
end
