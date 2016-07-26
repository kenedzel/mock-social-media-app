class UsersController < ApplicationController

	def my_friends
		@friendships = current_user.friends
	end

end