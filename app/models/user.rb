class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  acts_as_followable
  acts_as_follower

  has_many :my_tweets, dependent: :destroy, class_name: 'Tweet'

  after_save :assign_uid, unless: Proc.new { |user| user.uid.present? }

  def tweets
    Tweet.where(user_id: [id, following_users.pluck(:id)].flatten)
  end

  private
  def assign_uid
    begin 
      self.uid = "#{email.split('@')[0].upcase.gsub(/[.\/]/, '_')}" 
    end while User.where(uid: self.uid).where.not(id: self.id).any?
  end
end
