class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         
         has_many :authentications
         
  def self.find_or_create_for_twitter(response)
     data = response
     #if user = User.where(twitter_id: "#{data["id"]}").first
        #user
    #else # Create a user with a stub password.
     user = User.new(:email => "twitter+#{data["uid"]}@example.com",
      :password => Devise.friendly_token[0,20])
      user.twitter_id = data["uid"]
      user.twitter_screen_name = data["name"]
      user.twitter_display_name = data["nickname"]
      user.save
      user

     #end
   end
         
end
