class UsersController < ApplicationController

	def my_friends
		@friendships = current_user.friends
	end
	
	def search
		# @users = User.all
		@users = User.except_current_user(current_user.id)#.search(params[:search_param])
	
		# render status: :not_found, nothing: true unless @users.present?
	end

	def show
		@user = User.find(params[:id])
	end

	def add_friend
		@friend = User.find(params[:friend])
		current_user.friendships.build(friend_id: @friend.id)
		if current_user.save
			redirect_to my_friends_path, notice: "Friend was successfully added."
		else
			redirect_to my_friends_path, flash[:error] = "There was an error with adding user as friend."
		end
	end
end