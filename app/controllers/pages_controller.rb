class PagesController < ApplicationController
  # back end code for pages/index 
  def index
  end
  
  # back end code for pages/home
  def home
    @posts = Post.all
  end
  # this is the page that corresponds to ALL the pages.
  # back end code for pages/profile
  def profile
    # grab the username from the URL as :id
    # the if statement will check the database if there is a username e.g. if there is no "joeman" in the db, it will redirect
    if (User.find_by_username (params[:id]))
      @username = params[:id]
    else
      # redirect to 404 (root for now)
      redirect_to root_path, :notice=> "User not found"
    end
    
    @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]).id)
    @newPost = Post.new
    #.where("user_id = ?", User.find_by_username (params[:id]).id)
  end
  
  # back end code for pages/explore
  def explore
    @posts = Post.all
  end
end
