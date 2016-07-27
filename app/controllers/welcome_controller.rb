class WelcomeController < ApplicationController
  def index
  	@post = Post.new
  	@posts = Post.order('created_at DESC')
  	@user = current_user
  end

  def new
  	@post = Post.new
  end
end