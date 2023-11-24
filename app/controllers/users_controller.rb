class UsersController < ApplicationController
  skip_before_action(:authenticate_user!, {:only => [:index]})
  #index
    def index
      render({:template => "users/index"})
  
    end 

    def profile
      @this_user = User.where(:username => params.fetch("username")).first
      render({:template => "users/profile"})
    end 
    
    def liked_photos
      @this_user = User.where(:username => params.fetch("username")).first
      render({:template => "users/liked_photos"})
    end 
    
    def feed
      @this_user = User.where(:username => params.fetch("username")).first
      @all_leaders = @this_user.follow_sent.where(:status => "accepted").pluck(:recipient_id)
      @all_leader_photos = Photo.where(owner_id: @all_leaders)

      render({:template => "users/feed"})
    end

    def discover
      @this_user = User.where(:username => params.fetch("username")).first
      @all_leaders = User.where(id: @this_user.follow_sent.where(:status => "accepted").pluck(:recipient_id))
      @all_leader_likes = Like.where(fan_id: @all_leaders.pluck(:id))
      @all_leader_liked_photos = Photo.where(id: @all_leader_likes.pluck(:photo_id))

      render({:template => "users/discover"})
    end 
end
