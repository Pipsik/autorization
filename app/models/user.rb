class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_for_facebook_oauth access_token
    user = User.where(:email => access_token.info.email).first_or_create do |user|
      User.create!(:provider => access_token.provider, :url => access_token.info.urls, :username => access_token.extra.raw_info.name, :nickname => access_token.extra.raw_info.username, :email => access_token.extra.raw_info.email, :password => Devise.friendly_token[0,20]) 
    end
  end

  def self.find_for_vkontakte_oauth access_token
    user = User.where(:email => access_token.info.email).first_or_create do |user|
      User.create!(:provider => access_token.provider, :url => access_token.info.urls, :username => access_token.info.name, :nickname => access_token.extra.raw_info.domain, :email => access_token.info.email, :password => Devise.friendly_token[0,20]) 
    end
  end

  def self.find_for_twitter_oauth access_token
    user = User.where(:email => access_token.info.email).first_or_create do |user|
      User.create!(:provider => access_token.provider, :url => access_token.info.urls, :username => access_token.info.name, :nickname => access_token.extra.raw_info.domain, :email => access_token.info.email, :password => Devise.friendly_token[0,20]) 
    end
  end
end
