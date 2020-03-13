class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  acts_as_followable
  acts_as_follower

  has_many :tweets, dependent: :destroy

  before_validation :assign_uid, unless: Proc.new { |user| user.uid.present? }

  private
  def assign_uid
    begin 
      self.uid = "#{email.split('@')[0].upcase}" 
    end while User.where(uid: self.uid).any?
  end
end
