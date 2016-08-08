class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :courses
  has_many :schools
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
 scope :select_same_place,-> (user_id, city, country){
  select("*")
    .from("users")
    .where("id!=?", user_id)
    .where("city=?", city)
    .where("country=?", country)
 }

def full_name
  return "#{first_name} #{last_name}".strip if (first_name || last_name)
  "Anonymous"
end

def not_friends_with?(friend_id)
    friendships.where(friend_id: friend_id).count < 1
end


def self.search(param)
  return User.none if param.blank?
  param.strip!
  param.downcase!
  (first_name_matches(param) + last_name_matches(param) + email_matches(param)).uniq
  # return email_matches(param)
end

def self.first_name_matches(param)
  matches('first_name', param)
end

def self.last_name_matches(param)
  matches('last_name', param)
end

def self.email_matches(param)
  matches('email', param)
end

def self.matches(field_name, param)
  where("#{field_name} ilike ?", "%#{param}%")
end

end
