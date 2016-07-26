class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  has_many :friendships
  has_many :friends, through: :friendships
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


 scope :except_current_user,-> (user_id){
  select("*")
    .from("users")
    .where("id!=?", user_id)
    .order("id")
}

def not_friends_with?(friend_id)
    friendships.where(friend_id: friend_id).count < 1
 end

end
