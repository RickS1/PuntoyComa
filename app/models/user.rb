class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :omniauthable
  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    puts "#{auth}"
    user = User.where(:provider => auth.provider, :email => auth.uid+"@"+auth.provider+".com").first
puts "#{user}"
    unless user
      registered_user = User.where(:provider => auth.provider, :email => auth.uid+"@"+auth.provider+".com").first
      unless registered_user
        user = User.create(name: auth.extra.raw_info.name,
                            provider: auth.provider,
                            uid: auth.uid,
                            email: auth.uid+"@"+auth.provider+".com",
                            password: Devise.friendly_token[0,20],
                          )
      end

    end
  end

end
