class PostsController < ApplicationController
before_action :set_post, only: [:destroy]
  def new
  	@post = Post.new
  end

  def index
  	@posts = Post.order('created_at DESC')
  	@user = current_user
  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
	@post = Post.new(post_params)
	@post.user_id = current_user.id
	if @post.save
		puts "if"
		flash[:success] = "Post successfully added"
		redirect_to root_path
	else
		puts "else"
		flash[:danger] = "cant post."
	end
  end

  def destroy
  	@post.destroy
  	redirect_to root_path
  end

  	private
  	def set_post
  		@post = Post.find(params[:id])
  	end
	def post_params
		params.require(:post).permit(:user_id, :content)
	end

end