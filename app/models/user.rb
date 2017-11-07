class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  has_many :views, dependent: :destroy
  has_many :quiz_scores, dependent: :destroy

  def admin?
    admin == true
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    if self.where(provider: auth.provider, uid: auth.uid).first
      user = self.where(provider: auth.provider, uid: auth.uid).first
    else
      user = User.new
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      user.provider = auth.provider
      user.uid = auth.uid
    end
    user
  end
end
