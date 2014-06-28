#encoding:utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :uid
  # attr_accessible :title, :body
    attr_accessor :login
  attr_accessible :login
  validates_length_of :username, minimum:2, maximum: 14, too_short: "should be longer than 2 characters", too_long: "no longer than 14 characters"
  after_save { create_userinfo }
  def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end
    def create_userinfo
      if self.userinfo==nil
        self.userinfo=Userinfo.new
        self.userinfo.user_id=self.id
        self.userinfo.pr="prなし"
        self.userinfo.money=0
        # if self.userinfo.image==""
        # end
        self.userinfo.save
      end
    end
	has_many :passages
  has_one :userinfo
  has_many :comments
end
