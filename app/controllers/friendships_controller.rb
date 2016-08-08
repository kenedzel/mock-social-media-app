class FriendshipsController < ApplicationController

def destroy
	@friendship = current_user.friendships.where(friend_id: params[:id]).first
	@friendship.destroy
	flash[:danger] = "Friend successfully removed"
	redirect_to :back
end

end