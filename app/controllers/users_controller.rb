class UsersController < ApplicationController
  skip_before_action(:authenticate_user!, {:only => [:index]})
  #index
    def index
      render({:template => "users/index"})
  
    end 
end
