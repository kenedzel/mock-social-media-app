class WelcomeController < ApplicationController
  def index
  	@post = Post.new
  end

  def new
  	@post = Post.new
  end
end