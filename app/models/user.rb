class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :omniauthable, omniauth_providers: %i[github]
  has_many :topics
  has_many :comments
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.username = auth.extra.raw_info.login
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
